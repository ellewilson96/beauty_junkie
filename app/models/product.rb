class Product < ActiveRecord::Base
  belongs_to :brand
  accepts_nested_attributes_for :brand

  validates :name, presence: true
  validates :description, presence: true
end
