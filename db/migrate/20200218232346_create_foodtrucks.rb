class CreateFoodtrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :foodtrucks do |t|
      t.string :Name
      t.string :Type
      t.text :Address
      t.text :Description
      t.string :Owner

      t.timestamps
    end
  end
end
