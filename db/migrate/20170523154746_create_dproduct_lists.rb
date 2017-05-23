class CreateDproductLists < ActiveRecord::Migration[5.0]
  def change
    create_table :dproduct_lists do |t|
      t.integer :dorder_id
      t.string  :dproduct_name
      t.integer :dproduct_price
      t.integer :quantity

      t.timestamps
    end
  end
end
