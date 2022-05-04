class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :production
  
  validates :price, numericality: { other_than: 0 }
end
