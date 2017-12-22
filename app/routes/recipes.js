module.exports = function(app, db) {
  app.get("/recipes", (req, res) => {
    res.send({"recipes": []});
  });
};
