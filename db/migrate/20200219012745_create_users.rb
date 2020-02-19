class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.boolean :is_active, null: false, default: true
      t.boolean :is_owner, null: false, default: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
