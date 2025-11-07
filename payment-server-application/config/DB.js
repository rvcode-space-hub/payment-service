const { Sequelize, DataTypes } = require('sequelize');
const dotenv = require('dotenv');
dotenv.config();

// Create Sequelize instance
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: 'mysql',
    port: process.env.DB_PORT || 3306,
    logging: false,
  }
);

// ✅ Import models (make sure filenames match exactly)
const itn_wallets = require('../module/itn_wallet')(sequelize, DataTypes);
const itn_transactions = require('../module/itn_transactions')(sequelize, DataTypes);
const its_product_profiles = require('../module/its_product_profiles')(sequelize, DataTypes);
const its_service_types = require('../module/its_service_types')(sequelize, DataTypes);
const itn_channel_users = require('../module/itn_channel_users')(sequelize, DataTypes); // 🔹 fixed file name

module.exports = {
  sequelize,
  itn_wallets,
  itn_transactions,
  its_product_profiles,
  its_service_types,
  itn_channel_users,
};

console.log('✅ Models loaded:', Object.keys(module.exports));
