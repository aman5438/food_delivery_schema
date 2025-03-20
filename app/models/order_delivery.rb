class OrderDelivery < ApplicationRecord

  #associations
  belongs_to :order
  belongs_to :menu_item

  #validations
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price_at_time, presence: true, numericality: { greater_than: 0 }
end