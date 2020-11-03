class Admin::OrdersController < ApplicationController

	def index
		@path = Rails.application.routes.recognize_path(request.referer)
		case params[:order_sort]
		when "0"
			@order_title = "本日の注文履歴"
			@orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
		when "1"
			@customer = Customer.find(@path[:id])
			@order_title = @customer.name_family + @customer.name_first + "様の注文履歴"
			@orders = @customer.orders
		else
			@order_title = "注文履歴一覧"
			@orders = Order.all.reverse_order
		end


	end

	def show
		@order = Order.find(params[:id])
		@order_lists = @order.order_lists


	end

	def update
		@order = Order.find(params[:id])




	end

	private
end
