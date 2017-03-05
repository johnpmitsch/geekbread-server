class AddPrefermentToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :preferment, :boolean, :default => false
  end
end
