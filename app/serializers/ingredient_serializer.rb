class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :percentage, :recipe_id, :preferment, :levain, :flour
end
