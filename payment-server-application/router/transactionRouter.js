const express = require('express');
const router = express.Router();
const transactionController = require('../controllers/transactionController');

router.get('/transactions', transactionController.getAllTransactions);
router.get('/:wallet_id', transactionController.getByWallet);

module.exports = router;
