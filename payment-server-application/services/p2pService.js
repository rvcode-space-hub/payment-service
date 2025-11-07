const { v4: uuidv4 } = require("uuid");
const { sequelize, itn_wallets, itn_transactions } = require("../config/DB");
const validationService = require("./validationService");
const thresholdService = require("./thresholdService");
const chargeService = require("./chargeService");
const commissionService = require("./commissionService");

exports.transferAmount = async ({
  payor_wallet,
  payee_wallet,
  amount,
  service_type,
  user_id,
}) => {
  return await sequelize.transaction(async (t) => {

    // ✅ Step 1: Validate wallets and service
    const { sourceWallet, destWallet, serviceId } = await validationService.validateBasic(
      payor_wallet,
      payee_wallet,
      service_type,
      amount
    );

    // ✅ Step 2: Threshold check
    await thresholdService.validateThreshold(payor_wallet, amount);

    // ✅ Step 3: Lock sender wallet
    const [payorRows] = await sequelize.query(
      `SELECT balance FROM itn_wallets WHERE wallet_id = ? FOR UPDATE`,
      { replacements: [payor_wallet], transaction: t }
    );
    const payor = payorRows[0];
    if (!payor) throw new Error("Sender wallet not found");

    // ✅ Step 4: Calculate charges and commission
    const charge = chargeService.calculateCharge(amount);
    const commission = commissionService.applyCommission(amount);
    const totalDebit = amount + charge;

    if (payor.balance < totalDebit) throw new Error("Insufficient wallet balance");

    // --- Balances for sender
    const senderPrev = payor.balance;
    const senderNew = senderPrev - totalDebit;

    // ✅ Step 5: Deduct sender balance & update prev_balance
    await sequelize.query(
      `UPDATE itn_wallets 
       SET prev_balance = ?, balance = ? 
       WHERE wallet_id = ?`,
      { replacements: [senderPrev, senderNew, payor_wallet], transaction: t }
    );

    // ✅ Step 6: Lock receiver wallet
    const [receiverRows] = await sequelize.query(
      `SELECT balance FROM itn_wallets WHERE wallet_id = ? FOR UPDATE`,
      { replacements: [payee_wallet], transaction: t }
    );
    const receiver = receiverRows[0];
    if (!receiver) throw new Error("Receiver wallet not found");

    // --- Balances for receiver
    const receiverPrev = receiver.balance;
    const receiverNew = receiverPrev + amount + commission;

    // ✅ Step 7: Credit receiver & update prev_balance
    await sequelize.query(
      `UPDATE itn_wallets 
       SET prev_balance = ?, balance = ? 
       WHERE wallet_id = ?`,
      { replacements: [receiverPrev, receiverNew, payee_wallet], transaction: t }
    );

    // ✅ Step 8: Log transactions (Debit & Credit)
    await itn_transactions.create({
      transaction_id: uuidv4(),
      payor_wallet,
      payee_wallet,
      user_id,
      service_type: serviceId,
      amount: totalDebit,
      type: "DEBIT",
      status: "SUCCESS",
      created_at: new Date(),
    }, { transaction: t });

    await itn_transactions.create({
      transaction_id: uuidv4(),
      payor_wallet,
      payee_wallet,
      user_id,
      service_type: serviceId,
      amount: amount + commission,
      type: "CREDIT",
      status: "SUCCESS",
      created_at: new Date(),
    }, { transaction: t });

    // ✅ Step 9: Success message
    let message;
    switch (service_type) {
      case "Recharge":
      case "Jio Recharge":
        message = `${service_type} successful `;
        break;
      case "Rent Payment":
        message = `Rent payment successful `;
        break;
      case "P2P Transfer":
        message = `P2P Transfer successful `;
        break;
      default:
        message = `Transaction successful `;
    }

    // ✅ Step 10: Return summary
    return {
      success: true,
      message,
      transfer_amount: amount,
      service_charge: charge,
      commission_received: commission,
      sender_prev_balance: senderPrev,
      sender_new_balance: senderNew,
      receiver_prev_balance: receiverPrev,
      receiver_new_balance: receiverNew
    };
  });
};
