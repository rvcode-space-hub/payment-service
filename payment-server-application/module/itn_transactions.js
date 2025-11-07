module.exports = (sequelize, DataTypes) => {
  const itn_transactions = sequelize.define(
    "itn_transactions",
    {
      transaction_id: {
        type: DataTypes.STRING(36),
        primaryKey: true,
        allowNull: false,
      },

      // ✅ ADD THESE ↓
      payor_wallet: {
        type: DataTypes.STRING(36),
        allowNull: false,
      },

      payee_wallet: {
        type: DataTypes.STRING(36),
        allowNull: false,
      },

      user_id: {
        type: DataTypes.STRING(36),
        allowNull: true,
      },

      service_type: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },

      amount: {
        type: DataTypes.BIGINT,
        allowNull: false,
      },

      type: {
        type: DataTypes.STRING(20),
        allowNull: false,
      },

      status: {
        type: DataTypes.STRING(20),
        allowNull: false,
      },

      created_at: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: "itn_transactions",
      timestamps: false,
    }
  );

  return itn_transactions;
};
