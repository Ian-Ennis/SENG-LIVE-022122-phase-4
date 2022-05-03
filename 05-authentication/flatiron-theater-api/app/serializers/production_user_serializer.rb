# For implementation, see 'production_serializer.rb' (Line 6)

class ProductionUserSerializer < ActiveModel::Serializer
	attributes :name, :email
end
