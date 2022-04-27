class Ticket < ApplicationRecord
  belongs_to :production
  belongs_to :user

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  validates :production_id, presence: true
end