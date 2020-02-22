class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_no, null: false
      t.string :truck_id, null: false
      t.string :user_id, null: false
      t.integer :order_status, default: 2, null: false
      t.decimal :order_subtotal, precision: 6, scale: 2, null: false
      t.boolean :is_del, default: false, null: false
      t.timestamps
      t.index :order_no, name: 'unique_idx_order_no', unique: true
      t.index :truck_id, name: 'idx_truck_id'
      t.index :user_id, name: 'idx_user_id'
    end
  end
end
