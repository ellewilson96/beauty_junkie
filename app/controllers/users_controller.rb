class UsersController < ApplicationController

  def show
    @review = @product
    @product = Product.find(params[:id])
  end

  def index
    @reviews = current_user.reviews.all
    @products = Product.all
  end

end
