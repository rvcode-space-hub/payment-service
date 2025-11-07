const { v4: uuidv4 } = require('uuid');
const { itn_wallets, itn_transactions } = require('../config/DB');
const RechargeService = {
  createRecharge: async (user, { to_number, amount }) => {
    try {
    
      if(!user || !user.user_id) {
        console.log("User ID not found in request");
    };

    const wallet = await itn_wallets.findOne({ where: { user_id: user.user_id } });

    if(!wallet) {
      console.log("Wallet  not found");
    }

   
    if(wallet.balance < amount) {
      console.log("insufficient balance");
    }
      
     
      const prevBalance = wallet.balance;
      const newBalance = prevBalance - amount;

      await wallet.update({
        prev_balance: prevBalance,
        balance: newBalance,
        net_credit: 0,
      });

    
      await itn_transactions.create({
        transaction_id: uuidv4(),
        wallet_id: wallet.wallet_id,
        user_id: user.user_id,
        amount: amount,
        type: 'debit',          
        status: 'success',
        to_number: to_number,
        created_at: new Date(),
      });
      return {
        success: true,
        message: 'Recharge successful',
        data: {
          to_number,
          amount,
          prev_balance: prevBalance,
          new_balance: newBalance,
        },
      };

  } catch (error) {
      console.error('RechargeService Error:', error.message);
      throw error;
    }
  },
};

module.exports = RechargeService;
