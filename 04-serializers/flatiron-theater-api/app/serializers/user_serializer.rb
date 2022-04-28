# Group Activity #2 - Creating / Implementing Associative Serializers

# ✅ Check your answers at 'localhost:3000/users'

class UserSerializer < ActiveModel::Serializer
  # 1. Add attributes for "name", "email", "admin"
  attributes :name, :email, :admin

  # 2. Add Active Record Macros to Return Associated Tickets / Productions
  has_many :tickets
  has_many :productions

  # def name
  #   byebug
  # end
end
