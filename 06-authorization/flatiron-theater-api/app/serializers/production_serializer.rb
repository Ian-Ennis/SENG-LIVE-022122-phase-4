class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :image, :director, :budget, :ongoing

  has_many :tickets
  has_many :users

  def budget
    "$#{'%.2f' % object.budget}"
  end 

  def ongoing
    object.ongoing ? "Actively showing" : "Not showing"
  end 

end
