class UsersController < ApplicationController

  def show
    @reviews = current_user.reviews
    @review = @reviews.find_by(params[:review_id])
    @product = Product.find_by(params[:product_id])
    @comments = @review.comments
    @comment = Comment.new
  end


end
