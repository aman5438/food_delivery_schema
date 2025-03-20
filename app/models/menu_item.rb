class MenuItem < ApplicationRecord

  #associations
  belongs_to :resturants
  has_many :menu_items

  #validations
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :is_available, inclusion: { in: [true, false] }
end