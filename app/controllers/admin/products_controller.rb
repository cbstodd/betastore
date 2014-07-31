class Admin::ProductsController < ApplicationController

  def index
    @products = Product.order('name').all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    # Finds the product
    @product = Product.new(params.require(:product).permit!)
    if @product.save 
      redirect_to admin_products_path, notice: "Product #{@product.name} was created!"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit!) 
      redirect_to admin_products_path, notice: "Product #{@product.name} was updated Successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: "Product #{@product.name} has been deleted!"
  end

end
