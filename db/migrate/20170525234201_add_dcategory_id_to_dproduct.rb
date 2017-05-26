class AddDcategoryIdToDproduct < ActiveRecord::Migration[5.0]
  def change
    add_column :dproducts, :dcategory_id, :integer
  end
end
