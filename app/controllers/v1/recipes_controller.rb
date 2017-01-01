class V1::RecipesController < V1::ApiController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :authorize_recipe, except: [:index, :create]
  before_action :authenticate_user!

  # GET /v1/recipes
  def index
    if current_user
      @recipes = Recipe.where(:user_id => current_user.id)
    else
      return head :unauthorized
    end

    render json: @recipes
  end

  # GET /v1/recipes/1
  def show
    render json: @recipe
  end

  # POST /v1/recipes
  def create
    @recipe = Recipe.new(recipe_params)
    if current_user
      @recipe.user_id = current_user.id
    else
      head :unauthorized
    end

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

    def authorize_recipe
      unless current_user && @recipe && @recipe.user_id == current_user.id
        head :unauthorized
      end
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
