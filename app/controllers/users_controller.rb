class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @reviews = current_user.reviews
    if @reviews.present?
      @review = @reviews.find_by(params[:review_id])
      @product = Product.find_by(params[:product_id])
      @comments = @review.comments
      @comment = Comment.new
    else
    @review = Review.new
    render '_form'
  end
  end


end
