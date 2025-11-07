module.exports = (sequelize, DataTypes) => {
  const its_service_types = sequelize.define(
    "its_service_types",
    {
      service_type: {
        type: DataTypes.INTEGER,
        autoIncrement: true, 
        primaryKey: true
      },
      service_name: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      status: {
        type: DataTypes.STRING(100),
        allowNull: false,
        defaultValue: "active",
      },
    },
    {
      tableName: "its_service_types",
      timestamps: false,
    }
  );

  return its_service_types;
};
