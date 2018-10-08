class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments
  accepts_nested_attributes_for :product


  validates :body, presence: true
  validates :user, presence: true
  validates :title, presence: true
end
