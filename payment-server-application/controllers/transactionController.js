const TransactionService = require('../services/transactionService');

exports.getAllTransactions = async (req, res) => {
  try {
    const data = await TransactionService.getAllTransactions();
    return res.status(200).json({ success: true, data });
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message });
  }
};

exports.getByWallet = async (req, res) => {
  try {
    const data = await TransactionService.getTransactionsByWallet(req.params.wallet_id);
    return res.status(200).json({ success: true, data });
  } catch (err) {
    return res.status(500).json({ success: false, error: err.message });
  }
};
