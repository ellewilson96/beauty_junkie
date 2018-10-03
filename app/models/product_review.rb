class ProductReview < ActiveRecord::Base
  belongs_to :product
  belongs_to :review

  def name=(name)
    product = Product.find_or_create_by(name: name)
    self.product = product
  end

  def name
    self.product.name if self.product
  end

  def self.alphabetize
      self.order(name: :asc)
  end
  
end
