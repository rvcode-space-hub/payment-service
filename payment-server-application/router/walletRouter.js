const express = require('express');
const router = express.Router();
const WalletController = require('../controllers/walletController');

router.post('/wallets', WalletController.createWallet);
router.get('/all', WalletController.getAllWallets);
router.get('/:user_id', WalletController.getWallet);

module.exports = router;
