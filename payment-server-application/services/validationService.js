const { itn_wallets, its_service_types } = require("../config/DB");

exports.validateBasic = async (payor_wallet, payee_wallet, service_type, amount) => {
  
  if (!amount || amount <= 0) throw new Error("Amount is invalid");
  
  const sourceWallet = await itn_wallets.findByPk(payor_wallet);
  if(!sourceWallet) throw new Error("Payor Wallet not found");
  
  const destWallet = await itn_wallets.findByPk(payee_wallet);
  if(!destWallet) throw new Error("Payee Wallet not found");

  const service = await its_service_types.findOne({ where: { service_name: service_type  } });
  if (!service || service.status !== "active") {
    throw new Error("Invalid service type");
  }

  return { sourceWallet, destWallet };
};
