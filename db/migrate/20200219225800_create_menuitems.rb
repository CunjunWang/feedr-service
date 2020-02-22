class CreateMenuitems < ActiveRecord::Migration[6.0]
  def change
    create_table :menuitems do |t|
      t.string :Name
      t.text :Description
      t.decimal :price
      t.references :foodtruck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
