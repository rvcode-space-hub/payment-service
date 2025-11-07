const p2pService = require("../services/P2PService");

exports.sendMoney = async (req, res) => {
  try {
    const { payor_wallet, payee_wallet, amount, service_type } = req.body;
    const user_id = req.user.user_id;

    const result = await p2pService.transferAmount({
      payor_wallet,
      payee_wallet,
      amount,
      service_type,
      user_id,
    });

    res.status(200).json(result);
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};
