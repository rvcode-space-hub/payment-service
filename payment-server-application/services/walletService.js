const db = require('../config/DB');
const { itn_wallets } = db;
const { v4: uuidv4 } = require('uuid');

class WalletService {
  static async createWallet({ user_id, msisdn, balance }) {
    const wallet = await itn_wallets.create({
      wallet_id: uuidv4(),
      user_id,
      msisdn,
      user_type: 'CUSTOMER',
      wallet_type: 'DEFAULT',
      prev_balance: 0,
      balance: balance || 0
    });
    return wallet;
  }

  static async getWalletByUser(user_id) {
    return await itn_wallets.findOne({ where: { user_id } });
  }

  static async updateWalletBalance(user_id, amount) {
    const wallet = await itn_wallets.findOne({ where: { user_id } });
    if (!wallet) throw new Error('Wallet not found');
    wallet.prev_balance = wallet.balance;
    wallet.balance += Number(amount);
    await wallet.save();
    return wallet;
  }

  static async getAllWallets() {
    return await itn_wallets.findAll();
  }
}

module.exports = WalletService;
