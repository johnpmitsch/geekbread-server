const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const db = require("./models");

app.use(bodyParser.json({ type: "application/*+json" }));
//app.use(bodyParser.urlencoded({ extended: true }));

require("./routes")(app, db);

const PORT = process.env.PORT || 3001;

db.sequelize.sync().then(() => {
  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
  });
});

module.exports = app;
