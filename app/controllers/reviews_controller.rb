class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_review, only: [:show, :edit, :update, :destroy]


  def index
    @reviews = @product.reviews.alphabetize
    respond_to do |format|
      format.html
      format.json {render json: @reviews}
    end
  end

  def show
  end

  def new
    @review = @product.reviews.new
  end

  def create
    @review = @product.reviews.create(reviews_params)
    if @review.save
      redirect_to product_reviews_path(@product, @reviews)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_reviews_path(@product, @reviews)
  end

  private

  def reviews_params
    params.require(:review).permit(:name, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
