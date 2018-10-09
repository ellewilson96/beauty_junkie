class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :reviews
  
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :reviews


  validates :name, presence: true
  validates :description, presence: true
end
