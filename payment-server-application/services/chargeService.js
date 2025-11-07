exports.calculateCharge = (amount) => {
  let serviceCharge = 0;

  if (amount > 500) serviceCharge = amount * 0.01;  // 1%
  else serviceCharge = 5; // fixed ₹5

  return serviceCharge;
};
