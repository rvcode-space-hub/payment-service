const { itn_transactions } = require("../config/DB");
const { Op } = require("sequelize");

exports.validateThreshold = async (payor_wallet, amount) => {
  const today = new Date();
  const startOfDay = new Date(today.setHours(0, 0, 0, 0));

  const DAILY_LIMIT = 2000;
  const WEEKLY_LIMIT = 10000;
  const MONTHLY_LIMIT = 5000;
  const ANNUAL_LIMIT = 20000;

  // Daily
  const dailyAmount = await itn_transactions.sum("amount", {
    where: {
      payor_wallet,
      created_at: { [Op.gte]: startOfDay },
    },
  });
  if ((dailyAmount || 0) + amount > DAILY_LIMIT)
    throw new Error("Daily limit exceeded!");

  // Weekly
  const sevenDaysAgo = new Date();
  sevenDaysAgo.setDate(today.getDate() - 7);
  const weeklyAmount = await itn_transactions.sum("amount", {
    where: {
      payor_wallet,
      created_at: { [Op.gte]: sevenDaysAgo },
    },
  });
  if ((weeklyAmount || 0) + amount > WEEKLY_LIMIT)
    throw new Error("Weekly limit exceeded!");

  // Monthly
  const monthlyAmount = await itn_transactions.sum("amount", {
    where: {
      payor_wallet,
      created_at: { [Op.gte]: new Date(today.getFullYear(), today.getMonth(), 1) },
    },
  });
  if ((monthlyAmount || 0) + amount > MONTHLY_LIMIT)
    throw new Error("Monthly limit exceeded!");

  // Annual
  const annualAmount = await itn_transactions.sum("amount", {
    where: {
      payor_wallet,
      created_at: { [Op.gte]: new Date(today.getFullYear(), 0, 1) },
    },
  });
  if ((annualAmount || 0) + amount > ANNUAL_LIMIT)
    throw new Error("Annual limit exceeded!");

  return true;
};
