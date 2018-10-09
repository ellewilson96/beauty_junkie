class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(params[:id])
    @reviews = @product.reviews
  end

  def create
    @product = Product.build(product_params)
    if @product.save
      redirect_to product_reviews_path(@product.id, @reviews)
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :name, :description, :ingredient_list, reviews_attributes: [:title, :body])
  end

  def set_product
  @product = Product.find(params[:id])
end

end
