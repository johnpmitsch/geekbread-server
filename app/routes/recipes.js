const db = require("../models/");
const util = require('util')

module.exports = (app, db) => {
  app.get("/recipes", (req, res) => {
    db.recipe
      .all()
      .then(recipes => res.status(200).send(recipes))
      .catch(error => res.status(400).send(error));
  });

  app.post("/recipes", (req, res) => {
    console.log("before sqlize: " + req.body);
    console.log(util.inspect(req.body, false, null))
    db.recipe
      .create(req.body)
      .then(recipe => {
        console.log("inside post: " + recipe);
        console.log(util.inspect(recipe, false, null))
        res.status(201).send(recipe);
      })
      .catch(error => res.status(400).send(error));
  });
};
