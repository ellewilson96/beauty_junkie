class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
 end

  def index
    @products = Product.all
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
    @product = Product.find_by(params[:product_id])
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
    redirect_to product_reviews_path(@product)
  end


  private

  def review_params
    params.require(:review).permit(:title, :body)
  end


end
