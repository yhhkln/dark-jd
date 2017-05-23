class CreateDcarts < ActiveRecord::Migration[5.0]
  def change
    create_table :dcarts do |t|

      t.timestamps
    end
  end
end
