class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_lists

	enum payment: { クレジットカード: 0, 銀行振込: 1}
end
