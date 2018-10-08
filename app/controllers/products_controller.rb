class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def index
    @brand = Brand.find_by(params[:brand_id])
    @products = Product.all
    respond_to do |format|
     format.html
     format.json {render json: @products}
   end
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_reviews_path(@product, @reviews)
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :name, :description, :ingredient_list)
  end

end
