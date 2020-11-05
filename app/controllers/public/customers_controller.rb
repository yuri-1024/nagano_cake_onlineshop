class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
	  @customer.update(customer_params)
	  redirect_to customers_path
  end

  def unsubscribe
  	
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
  	redirect_to root_path
  end

  private
  def customer_params
  	params.require(:customer).permit(:name_family, :name_first, :name_family_kana, :name_first_kana, :postal_code, :address, :email)
  end


end