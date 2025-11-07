module.exports = (sequelize, DataTypes) => {
  const itn_wallets = sequelize.define('itn_wallets', {
    wallet_id: {
      type: DataTypes.STRING(36),
      allowNull: false,
      primaryKey: true,
    },
    user_id: {
      type: DataTypes.STRING(36),
      allowNull: true,
    },
    user_type: {
      type: DataTypes.STRING(20),
      allowNull: true,
    },
    msisdn: {
      type: DataTypes.STRING(15),
      allowNull: true,
    },
    wallet_type: {
      type: DataTypes.STRING(20),
      allowNull: true,
    },
    prev_balance: {
      type: DataTypes.BIGINT(19),
      allowNull: true,
    },
    balance: {
      type: DataTypes.BIGINT(19),
      allowNull: true,
    },
    net_credit: {
      type: DataTypes.BIGINT(19),
      allowNull: true,
    },
  }, {
    tableName: 'itn_wallets',
    timestamps: false, 

  });

  return itn_wallets;
};
