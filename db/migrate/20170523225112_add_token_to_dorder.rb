class AddTokenToDorder < ActiveRecord::Migration[5.0]
  def change
    add_column :dorders, :token, :string
  end
end
