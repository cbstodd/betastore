class CartsController < ApplicationController

  def show
    session[:cart] ||= []
    if params[:product_id].present?
      session[:cart] << params[:product_id]
    end
    @item_count = session[:cart].size  
  end


end