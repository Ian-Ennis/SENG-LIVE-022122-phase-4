class ProductionSerializer < ActiveModel::Serializer

  attributes :title, :genre, :description, :image, :director, :budget, :ongoing

  has_many :tickets
  has_many :users, serializer: ProductionUserSerializer

  def budget
    "$#{'%.2f' % object.budget}"
  end

  def ongoing
    object.ongoing ? 'Actively Showing' : 'Not Showing'
  end
end
