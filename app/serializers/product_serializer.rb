class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredient_list, :brand_id

end
