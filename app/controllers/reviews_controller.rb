class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find_by(params[:product_id])
    @reviews = Review.all
  end


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(reviews_params)
    if @review.save
      redirect_to product_reviews_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @user = current_user
    @comment = @review.comments
    @comment = Comment.new
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @product, status: 200}
    end
  end

  def edit
  @review = Review.find(params[:id])
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
    redirect_to product_reviews_path(@product, @reviews)
  end



  private

  def reviews_params
    params.require(:review).permit(:title, :body)
  end


end
