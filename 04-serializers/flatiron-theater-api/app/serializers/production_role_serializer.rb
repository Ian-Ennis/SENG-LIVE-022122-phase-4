# Group Activity - Creating / Implementing Associative Serializers

# ✅ Check your answers at 'localhost:3000/production_roles'

class ProductionRoleSerializer < ActiveModel::Serializer
  # 1. Add attributes for "role", "understudy", and "production"

  attributes :role, :understudy, :production

  # belongs_to :production, serializer: ProductionRoleProductionSerializer

  # 2. Add a method (production) that returns the Production Role's Production Title.
  def production
    object.production.title
  end
end
