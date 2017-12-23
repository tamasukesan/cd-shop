class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :get_all, ->(search) { where(User.arel_table[:first_name].matches("%#{search}%").or(User.arel_table[:last_name_kana].matches("%#{search}%").or(User.arel_table[:first_name_kana].matches("%#{search}%")))) }
  scope :leave, -> {where(deleted:false)}

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :address, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  # validates :password, presence: true

  has_many :carts
  has_many :orders

end
