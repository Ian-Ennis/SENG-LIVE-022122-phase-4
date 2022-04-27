class User < ApplicationRecord
    # GROUP ACTIVITY => Handle Foreign Key Restraint Errors
    # We must ensure that if a User is destroyed, any of the User's associated
    # resources (tickets) will also be destroyed.
    
    has_many :tickets
    has_many :productions, through: :tickets

    validates :name, presence: true, uniqueness: true
    
    # https://www.rubyguides.com/2015/06/ruby-regex/
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true
end