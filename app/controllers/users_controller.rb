class UsersController < ApplicationController

  def show
    @review = Review.find_by(params[:review_id])
  end

  def index
      @reviews = current_user.reviews.all
      respond_to do |f|
        f.html
        f.json {render json: @reviews}
      end
  end

end
