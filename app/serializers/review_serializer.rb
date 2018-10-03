class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  belongs_to :user
  has_many :comments
  has_many :products
end
