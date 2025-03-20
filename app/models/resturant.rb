class Resturant < ApplicationRecord

  #associations
  belongs_to :owners
  has_many :menu_items
  has_many :orders

  #validations
  validates :name, presence: true, length: { maximum: 20 }
  validates :location, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :cuisine_type, length: { maximum: 100 }
end