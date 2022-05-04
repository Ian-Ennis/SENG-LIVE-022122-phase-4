class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets
    
    validates :name, presence: true, uniqueness: true
    validates :email, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, presence: true, uniqueness: true
    validate :permitted_emails

    def permitted_emails
        unless email.match?(/gmail.com|yahoo.com|icloud.com/)
            errors.add(:permitted_emails, "I'm sorry that email is not permited")
        end
    end 
end
