class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
 end

  def index
    @product = Product.find(params[:product_id])
    respond_to do |f|
     f.html
     f.json {render json: @reviews}
   end
  end

  def create
    @review = current_user.reviews.build(review_params)
         if @review.save
       render json: @review, status: 201
     else
         flash[:message] = @review.errors.full_messages
       render json: {errors: @review.errors.full_messages}, status: 400
     end
   end

  def show
    respond_to do |f|
    f.html
    f.json {render json: @review}
  end
    @comments = @review.comments
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    @product = Product.find(params[:id])
  end

  def update
    @url = product_review_path
    @review = Review.find(params[:id])
    if @review.user_id = current_user.id
      @review.update_attributes(review_params)
      @review.save
      redirect_to products_path
    else
      @review.errors.add(:base, "You must be the original creator to make changes
      to this review.")
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to product_reviews_path(@product)
  end


  private

  def review_params
    params.require(:review).permit(:title, :body)
  end


end
