class ReviewSerializer < ActiveModel::Serializer
  attributes :product_id, :title, :body
  belongs_to :user
  belongs_to :product
  has_many :comments

end
