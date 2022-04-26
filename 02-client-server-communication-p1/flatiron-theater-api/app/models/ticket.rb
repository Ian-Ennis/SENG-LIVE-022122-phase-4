class Ticket < ApplicationRecord
    belongs_to :production
    belongs_to :user

    # GROUP ACTIVITY #2
    
    # Add Validation for "price" => Must Be Any Number Other Than 0
end