class Production < ApplicationRecord
    has_many :production_roles

    # GROUP ACTIVITY #1
    
    # 1. Add Active Record Associations
    
    # Production "has_many" Tickets
    # Procution "has_many" Users through Tickets
end
