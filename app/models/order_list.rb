class OrderList < ApplicationRecord
	has_many :sweets
	has_many :orders
end
