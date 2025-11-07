module.exports = (sequelize, DataTypes) => {
  const itn_transactions = sequelize.define(
    "itn_transactions",
    {
      transaction_id: {
        type: DataTypes.STRING(36),
        primaryKey: true,
        allowNull: false,
        defaultValue: DataTypes.UUIDV4, // ✅ auto-generate UUID if not provided
      },

      // ✅ Wallet IDs (sender and receiver)
      payor_wallet: {
        type: DataTypes.STRING(36),
        allowNull: false,
      },

      payee_wallet: {
        type: DataTypes.STRING(36),
        allowNull: false,
      },

      // ✅ Optional user reference
      user_id: {
        type: DataTypes.STRING(36),
        allowNull: true,
      },

      // ✅ Service type (text instead of int to avoid previous error)
      service_type: {
        type: DataTypes.STRING(50),
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
        allowNull: false,
        defaultValue: DataTypes.NOW, // ✅ same as MySQL CURRENT_TIMESTAMP
      },
    },
    {
      tableName: "itn_transactions",
      timestamps: false, // ✅ MySQL already has created_at
      underscored: true, // ✅ ensures snake_case consistency
    }
  );

  return itn_transactions;
};
