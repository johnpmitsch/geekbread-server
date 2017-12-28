process.env.NODE_ENV = "test";

let db = require("../app/models/");
let chai = require("chai");
let chaiHttp = require("chai-http");
let server = require("../app");
let should = chai.should();

const util = require('util')
const recipeLength = 3;
const testRecipeName = "batard";
const testRecipe = { name: testRecipeName };
const testRecipes = [
  { name: "pan bread" },
  { name: "ciabatta" },
  { name: "baguette" }
];

chai.use(chaiHttp);

describe("Recipes", () => {
  beforeEach(done => {
    // empty and seed database
    db.recipe.destroy({ where: {} }).then(() => {
      db.recipe.bulkCreate(testRecipes).then(() => {
        done();
      });
    });
  });

  describe("/GET recipe", () => {});
  it("it should GET all the recipes", done => {
    chai
      .request(server)
      .get("/recipes")
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.be.a("array").with.lengthOf(recipeLength);
        done();
      });
  });

  describe("/POST recipe", () => {});
  it("it should POST all the recipes", done => {
    console.log("before test post: " + testRecipe);
    console.log(util.inspect(testRecipe, false, null))
    chai
      .request(server)
      .post("/recipes")
      .send(testRecipe)
      .end((err, res) => {
        res.should.have.status(201);
        //res.body.name.should.equal(testRecipeName);
        console.log("chai request");
        console.log(util.inspect(res.body, false, null))
        console.log(res.body);
        console.log(err);
        done();
      });
  });
});
