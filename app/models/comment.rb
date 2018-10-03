class Comment < ActiveRecord::Base
  belongs_to :user, required: false
  belongs_to :review
  validates :body, presence: true
  
end
