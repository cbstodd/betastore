class Admin::ProductsController < ApplicationController

  before_action :require_login

  def index
    if logged_in?
    @products = Product.order('name').to_a
      # @products = Product.paginate(page: params[:page])
    else
      redirect_to admin_logins_path, alert: "Please log in."
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    # Finds the product
    @product = Product.new(products_param)
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
    if @product.update(products_param) 
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

  
  private

    def logged_in?
      session[:user_id].present?
    end

    def require_login
      unless logged_in?
        redirect_to admin_logins_path, danger: "Please log in to continue."
      end      
    end

    def products_param
      params.require(:product).permit(:name, :price, :image_url, :description)      
    end


end
