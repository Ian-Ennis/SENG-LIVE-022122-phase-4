class TicketSerializer < ActiveModel::Serializer
  attributes :price, :production, :user

 
  def production
    object.production.title
  end 

  def user
    object.user.name
  end 
end
