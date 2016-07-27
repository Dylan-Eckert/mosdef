class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.string :name
      t.text :ingredients
      t.decimal :price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
