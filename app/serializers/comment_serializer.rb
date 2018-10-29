class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :review_id

  belongs_to :user, required: false
  belongs_to :review
end
