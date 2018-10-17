class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments


  validates :body, presence: true
  validates :product, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates_length_of :body, :minimum => 140
end
