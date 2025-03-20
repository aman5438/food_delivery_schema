class DeliveryPartner < ApplicationRecord

  has_many :order_deliveries

  enum status: { available: 'available', on_trip: 'on_trip', inactive: 'inactive' }

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :vehicle_number, length: { maximum: 50 }, allow_blank: true
  validates :location, presence: true
end