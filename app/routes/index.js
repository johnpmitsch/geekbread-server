const recipes = require("./recipes.js");

module.exports = function(app, db) {
  recipes(app, db);
};
