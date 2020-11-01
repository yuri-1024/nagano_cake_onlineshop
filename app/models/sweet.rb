class Sweet < ApplicationRecord
	belongs_to :genres, optional: true
	has_many :carts
	has_many :order_lists
	attachment :image
end
