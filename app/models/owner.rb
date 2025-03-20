class Owner < ApplicationRecord

  #association
  has_many :resturants

  #validations
  validates :name, presence: true, length: {maxmium: 20}
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :password_hash, presence: true
end