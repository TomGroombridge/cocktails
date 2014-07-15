class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
    @product = Product.find(params[:id])
  end

	def new
    @product = Product.new
  end

  def create 
    @product = Product.create(params[:product].permit(:name, :price, :image))
    if @product.save
      redirect_to '/products'
    else
      flash[:alert] = @products.errors.map {|k,v| "#{k.capitalize} #{v}"}
      render new_product_path
    end
  end
end
