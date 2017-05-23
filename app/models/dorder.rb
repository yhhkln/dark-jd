class Dorder < ApplicationRecord
	  belongs_to :user
		has_many :dproduct_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

end
