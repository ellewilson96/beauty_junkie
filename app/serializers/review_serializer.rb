class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :product_id

  belongs_to :user
  belongs_to :product
  has_many :comments

end
