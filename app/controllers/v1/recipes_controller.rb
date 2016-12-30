class V1::RecipesController < V1::ApiController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :get_user

  # GET /v1/recipes
  def index
    @recipes = Recipe.all
    @recipes = @recipes.where(:user_id => @user) if @user

    render json: @recipes
  end

  # GET /v1/recipes/1
  def show
    render json: @recipe
  end

  # POST /v1/recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created 
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/recipes/1
  def destroy
    if @recipe.destroy
      render json: @recipe, :status => :ok
    else
      render :json => @recipe.errors, :status => :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name)
    end

    def get_user
      @user = User.find(params[:user_id]) if params[:user_id]
    end
end
