const express = require('express');
const router = express.Router();
const RechargeController = require('../controllers/rechargeController');
const authenticate = require('../middleware/authMiddleware');

router.post('/recharge', authenticate, RechargeController.createRecharge);

module.exports = router;



