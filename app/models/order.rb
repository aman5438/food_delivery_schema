class Order < ApplicationRecord

  #associations
  belongs_to :users
  belongs_to :resturants
  has_many :order_items
  has_one :payments
  has_one :order_delivery

  #enum
  enum status: { pending: 'pending', confirmed: 'confirmed', delivered: 'delivered' }
  
  #validations
  validates :total_price, presence: true, numericality: { greater_than: 0 }
end