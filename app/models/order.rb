class Order < ApplicationRecord
    enum status: { 受付中: 0, 商品準備中: 1, 出荷済: 2 }

	belongs_to :user
	has_many :order_items

	validates :billing_first_name, :billing_last_name, :billing_first_name_kana, :billing_last_name_kana, :billing_address, presence: true
	validates :billing_post_code, presence: true, format: { with: /\A\d{7}\z/ }
	validates :billing_phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
end
