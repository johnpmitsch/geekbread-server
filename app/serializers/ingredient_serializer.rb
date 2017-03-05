class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :percentage, :recipe_id, :type, :preferment
end
