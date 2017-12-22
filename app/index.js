const express = require("express");
const bodyParser = require("body-parser");
const app = express();

require("./routes")(app, {});

app.use(bodyParser.json());

const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

module.exports = app;
