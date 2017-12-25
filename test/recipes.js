process.env.NODE_ENV = "test";

//let Recipe = require('../app/models/recipe');

let chai = require("chai");
let chaiHttp = require("chai-http");
let server = require("../app");
let should = chai.should();
const recipeLength = 3;

chai.use(chaiHttp);
describe("Recipes", () => {
  beforeEach(done => {
    //empty the db
    done();
  });

  describe("/GET recipe", () => {});
  it("it should GET all the recipes", done => {
    chai
      .request(server)
      .get("/recipes")
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.have.property("recipes");
        res.body.recipes.should.be.a("array").with.lengthOf(recipeLength);
        done();
      });
  });

  describe("/POST recipe", () => {});
  let recipe = {name: "batard", ingredients: []};
  it("it should POST all the recipes", done => {
    chai
      .request(server)
      .post("/recipes")
      .end((err, res) => {
        res.should.have.status(200);
        res.body.should.have.property("errors");
        res.body.should.have.property("recipes");
        res.body.recipes.should.be.a("array").with.lengthOf(recipeLength + 1);
        done();
      });
  });
});
