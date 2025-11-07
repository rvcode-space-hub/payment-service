const { itn_wallets, its_service_types } = require("../config/DB");

exports.validateBasic = async (payor_wallet, payee_wallet, service_type, amount) => {
  
  if (!amount || amount <= 0)
  console.log("Amount Is Invalid");
  

  const sourceWallet = await itn_wallets.findByPk(payor_wallet);
  const destWallet = await itn_wallets.findByPk(payee_wallet);

 if(!sourceWallet){
    console.log("Payor Wallet Not Found");
  
 }
 if(!destWallet){
    console.log("Payee Wallet not Found");
    
 }


  const serviceExists = await its_service_types.findByPk(service_type);
  if (!serviceExists || serviceExists.status !== "active")
    throw new Error("Service is not active");

  return { sourceWallet, destWallet };
};
