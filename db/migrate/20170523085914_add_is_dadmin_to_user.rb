class AddIsDadminToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_dadmin, :boolean, default: false
  end
end
