class RemoveTypeFromIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :ingredients, :type, :string
  end
end
