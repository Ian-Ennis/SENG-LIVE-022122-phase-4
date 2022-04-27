class Production < ApplicationRecord
    
    # GROUP ACTIVITY => Handle Foreign Key Restraint Errors
    # We must ensure that if a Production is destroyed, any of the Production's 
    # associated resources (production_roles, tickets) will also be destroyed.

    has_many :production_roles
    has_many :tickets
    has_many :users, through: :tickets

    validates :title, presence: true, uniqueness: true
    validates :budget, numericality: { greater_than: 0 }
end
