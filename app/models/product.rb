class Product < ActiveRecord::Base
  has_many :product_reviews
  has_many :reviews, through: :product_reviews
  belongs_to :brand
  accepts_nested_attributes_for :brand

  validates :name, presence: true
  validates :description, presence: true
end
