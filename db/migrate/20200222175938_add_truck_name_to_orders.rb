class AddTruckNameToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :truck_name, :string, default: '', null: false
    add_column :orders, :truck_img, :string
  end
end
