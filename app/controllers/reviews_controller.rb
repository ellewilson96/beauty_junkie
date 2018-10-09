class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
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
     @review = Review.new(review_params)
     @user = User.find(params[:user_id])

     if @review.save
       render :index
     else
       @error = @review.errors.full_messages
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
    @review = Review.find(params[:id])
      if @review.user = current_user
        if @review.update(review_params)
          redirect_to @review
        else
    render :edit
      end
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
