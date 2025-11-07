const { itn_transactions } = require("../config/DB");
const { Op } = require("sequelize");

exports.validateThreshold = async (wallet_id, amount) => {
  const today = new Date();
  const startOfDay = new Date(today.setHours(0, 0, 0, 0));

  const dailyAmount = await itn_transactions.sum("amount", {
    where: {
      wallet_id,
      created_at: { [Op.gte]: startOfDay },
    },
  });

  const DAILY_LIMIT = 2000;
  const WEEKLY_LIMIT = 10000;
  const MONTHLY_LIMIT = 5000;
  const ANNUAL_LIMIT = 20000;

  if ((dailyAmount || 0) + amount > DAILY_LIMIT)
    console.log("Daily limit exceeded!");

  const weeklyAmount = await itn_transactions.sum("amount", {
    where: {
      wallet_id,
      created_at: {
        [Op.gte]: new Date(new Date() - 7 * 24 * 60 * 60 * 1000),
      },
    },
  });
  
  if ((weeklyAmount || 0) + amount > WEEKLY_LIMIT)
  console.log("Weekly limit exceeded!");

  const monthlyAmount = await itn_transactions.sum("amount", {
    where: {
      wallet_id,
      created_at: {
        [Op.gte]: new Date(new Date().getFullYear(), new Date().getMonth(), 1),
      },
    },
  });

    if ((monthlyAmount || 0) + amount > MONTHLY_LIMIT)
      console.log("Monthly limit exceeded!");
    const annualAmount = await itn_transactions.sum("amount", {
    where: {
        wallet_id,
        created_at: {
        [Op.gte]: new Date(new Date().getFullYear(), 0, 1),
        },
    },
    });
    
    if ((annualAmount || 0) + amount > ANNUAL_LIMIT)
      console.log("Annual limit exceeded!");


  return true;
};
