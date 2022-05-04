class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :admin

  has_many :tickets
  has_many :productions
end
