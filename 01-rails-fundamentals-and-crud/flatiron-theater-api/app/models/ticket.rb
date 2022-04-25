class Ticket < ApplicationRecord
    
    # GROUP ACTIVITY #1 - Adding Active Record Associations
    
    # 1. Generate Migration for Ticket with Necessary Foreign Keys
    
    # 2. Add Active Record Associations
    
    # Ticket "belongs_to" Production
    belongs_to :production

    # Ticket "belongs_to" User
    belongs_to :user
end