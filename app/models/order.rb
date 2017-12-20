class Order < ApplicationRecord
    enum status: { 受付中: 0, 商品準備中: 1, 出荷済: 2 }

	belongs_to :user
	has_many :order_items
end
