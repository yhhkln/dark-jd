class CreateDcartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :dcart_items do |t|
      t.integer :dcart_id
      t.integer :dproduct_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
