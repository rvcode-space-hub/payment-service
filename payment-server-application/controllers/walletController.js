const WalletService = require('../services/walletService');

exports.createWallet = async (req, res) => {
  try {
    const { user_id, msisdn, balance } = req.body;
    const wallet = await WalletService.createWallet({ user_id, msisdn, balance });
    return res.status(201).json({ success: true, wallet });
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message });
  }
};

exports.getWallet = async (req, res) => {
  try {
    const wallet = await WalletService.getWalletByUser(req.params.user_id);
    if (!wallet) return res.status(404).json({ success: false, message: 'Wallet not found' });
    return res.status(200).json({ success: true, wallet });
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message });
  }
};

exports.getAllWallets = async (req, res) => {
  try {
    const wallets = await WalletService.getAllWallets();
    return res.status(200).json({ success: true, wallets });
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message });
  }
};
