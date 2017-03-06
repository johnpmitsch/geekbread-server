class AddFlourToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :flour, :boolean, default: false
  end
end
