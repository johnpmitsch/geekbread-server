module.exports = function(app, db) {
	const recipes = [{"sourdough": []}, {"pan bread": []}, {"white bread": []}]
  app.get("/recipes", (req, res) => {
    res.send({"recipes": recipes});
  });
};
