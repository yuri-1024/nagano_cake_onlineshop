class OrderList < ApplicationRecord
	belongs_to :sweet
	belongs_to :order

	enum creat_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 発送準備中: 3, 製作完了: 4}
end
