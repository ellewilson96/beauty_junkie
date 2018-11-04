class UsersController < ApplicationController

  def show
    @reviews = current_user.reviews
   if @reviews.present?
     @review = @reviews.find_by(params[:review_id])
     respond_to do |f|
     f.html
     f.json {render json: @review, layout: false}
     @comments = @review.comments
     @comment = @review.comments.build
     @product = Product.find_by(params[:product_id])

   end
  else
   @review = Review.new
   render '_form'
 end
 end

end
