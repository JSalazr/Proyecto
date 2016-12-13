class Donation < ApplicationRecord
  belongs_to :campaign

  validates :monto, presence: true, numericality: {greater_than: 0}
end
