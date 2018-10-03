class Review < ActiveRecord::Base
  belongs_to :user
  has_many :product_reviews
  has_many :products, through: :product_reviews
  has_many :comments

  validates :body, presence: true
  validates :user, presence: true
  validates :title, presence: true
end
