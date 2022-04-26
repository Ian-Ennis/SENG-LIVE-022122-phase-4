class ProductionRole < ApplicationRecord
  belongs_to :production

  validates :role, presence: true, uniqueness: true
end
