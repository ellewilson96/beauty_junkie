class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.build
 end

  def index
    @product = Product.find(params[:product_id])
    @reviews = Review.all
  end

 def create
     @review = current_user.reviews.build(review_params)
         if @review.save
       redirect_to @review, notice: "Successfully created new review"
     else
        render 'new'
     end
   end


  def show
    @user = current_user
    @comment = @review.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
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
    redirect_to product_reviews_path(@product, @reviews)
  end


  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

  def set_review
   @review = Review.find(params[:id])
 end

end
