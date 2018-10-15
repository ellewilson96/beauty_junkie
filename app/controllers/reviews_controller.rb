class ReviewsController < ApplicationController
  before_action :set_product, only: [:new, :index, :create, :edit]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @review = Review.new
 end

  def index
    @reviews = current_user.reviews
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
    @review = current_user.reviews.build(review_params)
      respond_to do |f|
        if @review.save
        f.html { redirect_to @review, notice: 'Post was successfully created.' }
         f.json { render :show, status: :created, location: @review }
     else
        f.html { render :new }
        f.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
   end


  def edit
  end

  def update
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
    params.require(:review).permit(:title, :body, :product_id)
  end


end
