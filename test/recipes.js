process.env.NODE_ENV = "test";

//let Recipe = require('../app/models/recipe');

let chai = require("chai");
let chaiHttp = require("chai-http");
let server = require("../app");
let should = chai.should();

chai.use(chaiHttp);
//Our parent block
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
				res.body.recipes.should.be.a("array");
        done();
      });
  });
});
