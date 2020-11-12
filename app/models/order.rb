class Order < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :order_lists

	enum payment: { クレジットカード: 0, 銀行振込: 1}
	enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送完了: 4}
end
