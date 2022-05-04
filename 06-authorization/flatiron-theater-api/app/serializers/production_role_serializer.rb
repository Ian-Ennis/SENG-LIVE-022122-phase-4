class ProductionRoleSerializer < ActiveModel::Serializer
  attributes :role, :understudy, :production

  def production
    object.production.title
  end 
end
