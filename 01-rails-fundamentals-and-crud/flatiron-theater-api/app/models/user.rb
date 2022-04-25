class User < ApplicationRecord
    # GROUP ACTIVITY #1
    
    # 1. Generate Migration for User
    
    # 2. Add Active Record Associations
    
    # User "has_many" Tickets
    has_many :tickets

    # User "has_many" Productions Through Tickets
    has_many :productions, through: :tickets
end