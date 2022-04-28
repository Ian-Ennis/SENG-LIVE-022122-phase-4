# Group Activity - Creating / Implementing Associative Serializers

# ✅ Check your answers at 'localhost:3000/tickets'

class TicketSerializer < ActiveModel::Serializer
  # 1. Add attributes for "price", "production", "user"
  attributes :price, :production, :user

  # 2. Add a method (production) that returns a Ticket's Production's "title"
  def production
    # byebug

    object.production.title
  end

  # 3. Add a method (user) that returns a Ticket's User's "name"
  def user
    object.user.name
  end

  # 3. Add a method (price) that returns Ticket's price as a floating point number
  # with only two digits following the decimal point (i.e., 75.00)
  def price
    "$#{'%.2f' % object.price}"
  end
end
