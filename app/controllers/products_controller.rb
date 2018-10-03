class ProductsController < ApplicationController
  before_action :authenticate_user!


  def new
    @product = Product.new
    #8.times {review = @product.reviews.build}
    8.times {@product.product_reviews.build}
  end

  def index
    @products = current_user.products.alphabetize
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.user = current_user
      if @product.save
        redirect_to products_path
      else
        render :new
      end
    end
    #render json: @product, status: 201
  end

  def show
    @user = current_user
    @product = Product.find(params[:id])
    @reviews = @product.product_reviews
    @comment = @product.comments
    @comment = Comment.new
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @product, status: 200}
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user = current_user
      if @product.update(product_params)
        redirect_to @product
      else
        render :edit
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :name, :description, :ingredient_list, product_reviews_attributes: [:product_id, :user_id, :title, :body])
  end

end
