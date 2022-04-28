class User < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :productions, through: :tickets

    validates :name, presence: true, uniqueness: true

    # https://www.rubyguides.com/2015/06/ruby-regex/
    # Additional Resources for Regex Expression Generators
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true

    # GROUP ACTIVITY => Create Custom Validation "permitted_emails" 
    # (/gmail.com|yahoo.com|icloud.com/)
end