class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.string :order_no, null: false
      t.integer :item_id, null: false
      t.string :item_name, default: 2, null: false
      t.decimal :item_price, precision: 6, scale: 2, null: false
      t.integer :quantity, default: 1, null: false
      t.string :img_url
      t.boolean :is_del, default: false, null: false
      t.timestamps
      t.index :order_id, name: 'idx_order_id'
      t.index :order_no, name: 'idx_order_no'
    end
  end
end
