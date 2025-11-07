
const db = require('../config/DB');
const { itn_transactions } = db;
const { v4: uuidv4 } = require('uuid');

class TransactionService {
  static async getAllTransactions() {
    try {
      return await itn_transactions.findAll({
        order: [['created_at', 'DESC']],
      });
    } catch (err) {
      console.log("Error fetching transactions:", err);
    }
  }

  static async getTransactionsByWallet(wallet_id) {
    try {
      return await itn_transactions.findAll({
        where: { wallet_id },
        order: [['created_at', 'DESC']],
      });
    } catch (err) {
      console.log("Error fetching transactions by wallet:", err);
      
    }
  }


  static async createTransaction({ wallet_id, user_id, amount, type, status }) {
    try {
      return await itn_transactions.create({
        transaction_id: uuidv4(),
        wallet_id,
        user_id,
        amount,
        type,
        status,
        created_at: new Date(),
      });
    } catch (err) {
      console.log("Error creating transaction:", err);
    }
  }
}

module.exports = TransactionService;
