class Production < ApplicationRecord
    has_many :production_roles

    # GROUP ACTIVITY #1
    
    # 1. Add Active Record Associations
    
    # Production "has_many" Tickets
    has_many :tickets

    # Production "has_many" Users through Tickets
    has_many :users, through: :tickets
end
