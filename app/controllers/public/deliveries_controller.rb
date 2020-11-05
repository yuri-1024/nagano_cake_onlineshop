class Public::DeliveriesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to deliveries_path
  end

  def update
  end

  def destroy
  end

  private
  def delivery_params
    params.require(:delivery).permit(:name, :address, :postal_code)
  end
end
