class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = @product.reviews.new
  end

  def index
    @reviews = current_user.reviews.order('created_at DESC')
  end


  def create
    @review = @product.reviews.create(reviews_params)
    if @review.save
      redirect_to product_reviews_path(@product, @reviews)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @product = Product.find(params[:id])
    @reviews = @product.product_reviews
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
    params.require(:review).permit(:name, :product_id, product_reviews_attributes: [:product_id, :user_id, :title, :body])
  end

  def set_product
      @product = Product.find(params[:product_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end
end
