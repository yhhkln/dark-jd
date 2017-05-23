class Dcart < ApplicationRecord
  has_many :dcart_items
  has_many :dproducts, through: :dcart_items, source: :dproduct

	def add_dproduct_to_dcart(dproduct)
    ci = dcart_items.build
    ci.dproduct = dproduct
    ci.quantity = 1
    ci.save
  end

  def total_price
    sum = 0
    dcart_items.each do |dcart_item|
      if dcart_item.dproduct.price.present?
        sum += dcart_item.quantity * dcart_item.dproduct.price
      end
    end
    sum
  end
  def clean!
    dcart_items.destroy_all
  end

end
