class Public::CartsController < ApplicationController

	def create
		@cart = Cart.new(cart_params)
		@cart.customer_id =current_customer.id
		@a = false
		current_customer.carts.each do |cart|
			if @cart.sweet_id == cart.sweet_id
				new_amount = cart.amount + @cart.amount
				cart.update_attribute(:amount, new_amount)
				@a = true
				break
			end
		end
		unless @a
			@cart.save
		end
		redirect_to carts_path
	end

	def update
		@cart = Cart.find(params[:id])
		@cart.update(cart_params)
		redirect_to carts_path
	end

	def index
		@carts = Cart.all

	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy
		redirect_to carts_path
	end

	def destroy_all
		@carts = current_customer.carts
		@carts.destroy_all
		redirect_to sweets_path
	end

	private

	def cart_params
		params.require(:cart).permit(:amount, :sweet_id)
	end



end
