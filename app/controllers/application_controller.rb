class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    respond_to :html, :json

      def home
        @reviews = Review.all
        @products = Product.all
    end

end
