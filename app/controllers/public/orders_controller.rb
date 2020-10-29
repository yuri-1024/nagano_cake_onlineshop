class Public::OrdersController < ApplicationController

	def new
		@order = Order.new
	end

	def comfirm
		@customer = current_customer
		@order = Order.new
		@carts = Cart.all
		if params[:order][:address_option] == "0"
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.name = current_customer.name_family + current_customer.name_first

		else params[:order][:address_option] == "1"
			@order.postal_code = params[:order][:postal_code]
			@order.address = params[:order][:address]
			@order.name = params[:order][:name]
		end

	end


	def create
		@order = Order.new
		@order.save
		redirect_to complete_path
	
	end




end
