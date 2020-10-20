class Admin::CustomersController < ApplicationController

	def index
		@customer = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end
	def update
		@customer = Customer.find(params[:id])
		@customer.save(customer_params)
		redirect_to admin_customer_path(@customer.id)
	end

	private
	def customer_params
		params.require(:customer).permit(:name_family, :name_first, :name_family_kana, :name_first_kana, :postal_code, :address, :email)
	end



end
