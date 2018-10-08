class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments

  validates :body, presence: true
  validates :user, presence: true
  validates :title, presence: true
end
