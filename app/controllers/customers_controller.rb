class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
  end
  
  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_path, notice: 'Customer was successfully deleted.' }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
  
   # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:customer_name)
    end
    
end
