class AddAasmStateToDorder < ActiveRecord::Migration[5.0]
  def change
    add_column :dorders, :aasm_state, :string, default: "dorder_placed"
    add_index  :dorders, :aasm_state
  end
end
