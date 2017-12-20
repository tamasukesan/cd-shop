class Adminster < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :address, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
end
