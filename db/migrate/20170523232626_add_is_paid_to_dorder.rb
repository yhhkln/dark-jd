class AddIsPaidToDorder < ActiveRecord::Migration[5.0]
  def change
    add_column :dorders, :is_paid, :boolean, default: false
  end
end
