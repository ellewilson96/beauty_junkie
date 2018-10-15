class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    respond_to :html, :json

      def home
        @products = Product.all
        @reviews = Review.all
    end

end
