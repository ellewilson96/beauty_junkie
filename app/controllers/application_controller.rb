class ApplicationController < ActionController::Base
    before_action :authenticate_user!

      def home
        @products = Product.all
        @reviews = Review.all
    end

end
