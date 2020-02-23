class CreateOrderUpdateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :order_update_records do |t|
      t.integer :order_id, null: false
      t.string :order_no, null: false
      t.integer :before_update_status_code, null: false
      t.string :before_update_status, null: false
      t.integer :after_update_status_code, null: false
      t.string :after_update_status, null: false
      t.integer :operator_id
      t.string :operator_name
      t.boolean :is_del, default: false, null: false
      t.timestamps
      t.index :order_id, name: 'idx_record_order_id'
      t.index :order_no, name: 'idx_record_order_no'
    end
  end
end
