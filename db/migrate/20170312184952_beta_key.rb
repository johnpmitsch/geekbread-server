class BetaKey < ActiveRecord::Migration[5.0]
  def change
		create_table :beta_keys do |t|
      t.string :beta_key
      t.timestamps
    end
  end
end
