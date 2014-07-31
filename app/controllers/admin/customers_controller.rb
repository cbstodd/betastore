class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.order('id').all  
  end

  def show
    @customer = Customer.find(params[:id])  
  end

  def edit
    @customer = Customer.find(params[:id])  
  end

  def new
    @customer = Customer.new    
  end

  def create
    @customer = Customer.new(params.require(:customer).permit!)
    if @customer.save 
      redirect_to admin_customers_path, notice: "Customer #{@customer.name} was created!"
    else
      render 'new'
    end    
  end

  def update
      @customer = Customer.find(params[:id])
    if @customer.update(params.require(:customer).permit!) 
      redirect_to admin_customers_path, notice: "Customer #{@customer.name} was updated Successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path, notice: "Customer #{@customer.name} has been deleted!"
  end


end