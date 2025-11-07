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

    // ✅ Step 1: General Validations
    await validationService.validateBasic(
      payor_wallet,
      payee_wallet,
      service_type,
      amount
    );

    // ✅ Step 2: Thresholds (Daily / Weekly / Monthly)
    await thresholdService.validateThreshold(payor_wallet, amount);

    // ✅ Step 3: Lock balance (FOR UPDATE prevents race condition)
    const [payor] = await sequelize.query(
      `SELECT balance FROM itn_wallets WHERE wallet_id = ? FOR UPDATE`,
      { replacements: [payor_wallet], transaction: t }
    );

    if (!payor) throw new Error("Sender wallet not found");

    // ✅ Step 4: Charge + Commission Calculation
    const charge = chargeService.calculateCharge(amount);
    const commission = commissionService.applyCommission(amount);
    const totalDebit = amount + charge;

    if (payor.balance < totalDebit)
      throw new Error("Insufficient wallet balance");

    // ✅ Step 5: Deduct balance from sender
    await sequelize.query(
      `UPDATE itn_wallets SET balance = balance - ? WHERE wallet_id = ?`,
      { replacements: [totalDebit, payor_wallet], transaction: t }
    );

    // ✅ Step 6: Add balance to receiver
    await sequelize.query(
      `UPDATE itn_wallets SET balance = balance + ? WHERE wallet_id = ?`,
      { replacements: [amount + commission, payee_wallet], transaction: t }
    );

    // ✅ Step 7: Create DB Transaction logs (DEBIT + CREDIT)

    await itn_transactions.create(
      {
        transaction_id: uuidv4(),
        payor_wallet,
        payee_wallet,
        user_id,
        service_type,
        amount: totalDebit,
        type: "DEBIT",
        status: "SUCCESS",
      },
      { transaction: t }
    );

    await itn_transactions.create(
      {
        transaction_id: uuidv4(),
        payor_wallet,
        payee_wallet,
        user_id,
        service_type,
        amount: amount + commission,
        type: "CREDIT",
        status: "SUCCESS",
      },
      { transaction: t }
    );

    return {
      success: true,
      message: "P2P Transfer Successful ✅",
      transfer_amount: amount,
      service_charge: charge,
      commission_received: commission,
    };
  });
};
