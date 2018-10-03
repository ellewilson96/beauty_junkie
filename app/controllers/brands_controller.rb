class BrandsController < ApplicationController

  def new
    @brand = Brand.new(brand_params)
  end

  def create
    @brand = Brand.new(brand_params)
      if @brand.save
        redirect_to brands_path
      else
        render :new
      end
    end
    #render json: @product, status: 201
  end
  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end
