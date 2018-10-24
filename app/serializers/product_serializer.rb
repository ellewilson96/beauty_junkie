class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredient_list, :brand_id

  belongs_to :brand
  has_many :reviews
end
