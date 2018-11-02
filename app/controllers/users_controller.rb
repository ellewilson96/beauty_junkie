class UsersController < ApplicationController

  def show
    @reviews = current_user.reviews
   if @reviews.present?
     render json: @review, layout: false
     @product = Product.find_by(params[:product_id])
   else
   @review = Review.new
   render '_form'
 end
 end

end
