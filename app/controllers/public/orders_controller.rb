class Public::OrdersController < ApplicationController

	def index
		@path = Rails.application.routes.recognize_path(request.referer)
		@customer = Customer.find(@path[:id])
		@orders = @customer.orders
	end

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
		@order = Order.new(order_params)
		@order.save!

		@carts = current_customer.carts.all
		  @carts.each do |cart|
		  	@order_list = OrderList.new(order_list_params)
		  	@order_list.sweet_id = cart.sweet.id
		  	@order_list.order_id = @order.id
		  	@order_list.price = (cart.sweet.price * 1.1).floor
		  	@order_list.amount = cart.amount
		  	@order_list.save
		  end
		@carts.destroy_all
		redirect_to complete_path
	end

	private

	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :cost, :charge, :payment, :status)
		
	end

	def order_list_params
		
	end




end
