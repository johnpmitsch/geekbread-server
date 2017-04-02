class AddBetaKeyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :beta_key, :string
  end
end
