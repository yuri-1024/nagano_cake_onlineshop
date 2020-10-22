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
	redirect_to public_customer_path(@customer.id)
  end

  private
  def customer_params
  	params.require(:customer).parmit(:name_family, :name_first, :name_family_kana, :name_first_kana, :postal_code, :address, :email)
  end


end