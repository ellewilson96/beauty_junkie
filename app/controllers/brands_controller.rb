class BrandsController < ApplicationController

  def index
    @brands = Brand.all
    respond_to do |f|
      f.html
      f.json {render json: @brands, layout: false}
   end
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
def show
  @products = @brand.products
  @product = @brand.products.build
end

  private

  def brand_params
    params.require(:brand).permit(:name, products_attributes: [:brand_id, :name, :description, :ingredient_list])
  end

end
