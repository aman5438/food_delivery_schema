class Payment < ApplicationRecord

  belongs_to :order
  belongs_to :user

  enum payment_method: { UPI: 'UPI', Card: 'Card', COD: 'COD' }
  enum status: { success: 'success', failed: 'failed', pending: 'pending' }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end