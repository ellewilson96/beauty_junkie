class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user, required: false
  belongs_to :review
end
