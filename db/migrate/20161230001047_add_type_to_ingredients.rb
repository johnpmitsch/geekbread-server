class AddTypeToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :type, :string, :default => "Other"
  end
end
