class AddLevainToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :levain, :boolean, default: false
  end
end
