class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
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

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

end
