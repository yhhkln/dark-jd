class AddDataToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :data, :data
  end
end
