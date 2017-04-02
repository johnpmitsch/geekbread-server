class V1::IngredientsController < V1::ApiController
  before_action :set_ingredient, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  after_action  :create_levain, only: [:create]

  # GET /v1/ingredients
  def index
    @ingredients = Ingredient.where(recipe_id: params[:recipe_id]) if params[:recipe_id]
    @ingredients = @ingredients.where(preferment: params[:preferment]) if params[:preferment]
    @ingredients = @ingredients.order(flour: :desc, percentage: :desc)

    render json: @ingredients
  end

  # GET /v1/ingredients/1
  def show
    render json: @ingredient
  end

  # POST /v1/ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/ingredients/1
  def destroy
    if @ingredient.destroy
      render json: @ingredient, :status => :ok
    else
      render :json => @ingredient.errors, :status => :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :percentage, :recipe_id, :preferment, :flour, :levain)
    end

    def create_levain
      if @ingredient.preferment?
        unless @ingredient.recipe.levain_exists?
          # add the percentage of the recipe that is the preferment
          levain = Ingredient.new({name: "preferment",
                                   percentage: "20",
                                   recipe_id: @ingredient.recipe.id,
                                   levain: true})
          levain.save
        end
      end
    end
end
