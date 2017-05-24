class AddPaymentMethodToDorder < ActiveRecord::Migration[5.0]
  def change
    add_column :dorders, :payment_method, :string

  end
end
