class CreateFoodtrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :foodtrucks do |t|
      t.string :Name
      t.string :Type
      t.text :Address
      t.text :Description
      t.string :Owner
      t.integer :user_id
      t.timestamps
      t.boolean :is_open, default: false
      t.decimal :latitude
      t.decimal :longitude
    end
  end
end
