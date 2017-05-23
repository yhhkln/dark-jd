class AddImageToDproduct < ActiveRecord::Migration[5.0]
  def change
    add_column :dproducts, :image, :string
  end
end
