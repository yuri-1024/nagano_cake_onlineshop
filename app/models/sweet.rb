class Sweet < ApplicationRecord
	belongs_to :genres, optional: true
	has_many :carts
	attachment :image
end
