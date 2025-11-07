module.exports = (sequelize, DataTypes) => {

const its_product_profiles = sequelize.define('its_product_profiles', {
    profile_id: {type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true},
    profile_name: DataTypes.STRING(100),
    service_provider: DataTypes.STRING(100),
    product_type: DataTypes.STRING(100),
    product_code: DataTypes.STRING(100),
    recharge_type: DataTypes.STRING(100),
   marginType: DataTypes.STRING(50),
   status: {type: DataTypes.STRING(100), defaultValue: 'active'},
}, {
  
    tableName: 'its_product_profiles',
    timestamps: false,
    
    
});

return its_product_profiles;
};


