class Public::CustomersController < ApplicationController

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
	@customer.update(customer_params)
	redirect_to customer_path(current_customer.id)
  end

  def unsubscribe
  	
  end

  def withdraw
  	
  end

  private
  def customer_params
  	params.require(:customer).permit(:name_family, :name_first, :name_family_kana, :name_first_kana, :postal_code, :address, :email)
  end


end