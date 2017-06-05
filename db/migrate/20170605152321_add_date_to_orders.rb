class AddDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :date, :data

  end
end
