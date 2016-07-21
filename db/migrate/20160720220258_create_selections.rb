class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.string :menu
      t.string :name
      t.text :ingredients
      t.decimal :price

      t.timestamps
    end
  end
end
