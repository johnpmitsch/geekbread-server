module.exports = (sequelize, DataTypes) => {
  const recipe = sequelize.define(
    "recipe",
    {
      name: DataTypes.STRING
    },
    {
      classMethods: {
        associate: function(models) {
          // associations can be defined here
        }
      }
    }
  );
  return recipe;
};
