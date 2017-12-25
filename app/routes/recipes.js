module.exports = function(app, db) {
  const recipes = [
    { name: "sourdough", ingredients: [] },
    { name: "pan bread", ingredients: [] },
    { name: "baguette", ingredients: [] }
  ];

  app.get("/recipes", (req, res) => {
    res.json({ recipes: recipes });
  });

  app.post("/recipes", (req, res) => {
    recipes.push(req.body);
    let errors = []
    res.json({ errors: errors, recipes: recipes });
  });
};
