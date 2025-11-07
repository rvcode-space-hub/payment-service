module.exports = (sequelize, DataTypes) => {
  const itn_channel_users = sequelize.define('itn_channel_users', {
    user_id: {
      type: DataTypes.STRING(20),
      primaryKey: true,
    },
    user_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
  }, {
    tableName: 'itn_channel_users',
    timestamps: false,
 
  });

  return itn_channel_users;
};
