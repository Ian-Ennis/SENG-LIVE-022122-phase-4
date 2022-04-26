class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets

    # GROUP ACTIVITY #2
    
    # Add Validation for "name" => Must Be Present / Unique
end