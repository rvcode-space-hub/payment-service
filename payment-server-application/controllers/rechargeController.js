const RechargeService = require('../services/rechargeService');

exports.createRecharge = async (req, resp) => {
  try {

    console.log("REQ.USER:", req.user);

    const { to_number, amount } = req.body;

    if (!to_number || !amount) {
      return resp.status(400).json({
        success: false,
        message: 'Missing required fields: to_number or amount'
      });
    }

    if (!req.user || !req.user.user_id) {  
      return resp.status(401).json({
        success: false,
        message: 'Unauthorized: User not authenticated',
      });
    }
      
    const result = await RechargeService.createRecharge(req.user, { to_number, amount });
    return resp.status(200).json(result);

  } catch (err) {
    console.error('RechargeController Error:', err.message);
    return resp.status(500).json({
      success: false,
      error: err.message
    });
  }
};
