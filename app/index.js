const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const db = require("./models");

require("./routes")(app, db);

app.use(bodyParser.json());

const PORT = process.env.PORT || 3001;

db.sequelize.sync().then(function() {
  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
});

module.exports = app;
