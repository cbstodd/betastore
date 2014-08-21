class ProductsController < ApplicationController

  def index
    @products = Product.order('name').all
      # @products = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end




end
