class Sweet < ApplicationRecord
	belongs_to :genre, optional: true
	has_many :carts
	has_many :order_lists
	attachment :image

	enum is_soldout: { 販売中: 0, 売り切れ: 1 }

end
