class User < ApplicationRecord

  #associations
  has_many :orders
  has_many :payments

  #validations
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :password_hash, presence: true
  validates :address, presence: true 

end
