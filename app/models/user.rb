class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :leave, -> {where(deleted:false)}

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :address, :password, :password_confirmation, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :password, presence: true

  has_many :cart
  has_many :orders

end
