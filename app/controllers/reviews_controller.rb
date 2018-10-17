class ReviewsController < ApplicationController
  before_action :set_product, only: [:new, :index, :create, :edit]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
 end

  def index
    @reviews = @product.reviews
    respond_to do |f|
     f.html
     f.json {render json: @reviews}
   end
  end


  def show
    @comments = @review.comments
    @comment = @review.comments.build
 end

 def create
   product = Product.find(params[:product_id])
   @review = product.reviews.build(review_params)
   if @review.save
     redirect_to product_reviews_path(@product.id, @reviews)
   else
     render :new
   end
 end


  def edit
  end

  def update
      @review.update_attributes(review_params)
    if  @review.save
      redirect_to products_path
    else
      @review.errors.add(:base, "You must be the original creator to make changes
      to this review.")
      render :edit
    end
  end

  def destroy
    @review.delete
    redirect_to product_reviews_path(@product)
  end


  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_product
    @product = Product.find_by(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end


end
