class Admin::SweetsController < ApplicationController

	def index
	end

	def new
		@sweet = Sweet.new
	end

	def create
		@sweet = Sweet.new(sweet_params)
		@sweet.save
		redirect_to admin_sweet_path(@sweet.id)
	end

	def show
		@sweet = Sweet.find(params[:id])
	end

	def edit
		@sweet = Sweet.find(params[:id])
	end

	def update
		@sweet = Sweet.find(params[:id])
		@sweet.update(sweet_params)
		redirect_to admin_sweet_path(@sweet)
	end

	private
	def sweet_params
		params.require(:sweet).permit(:name, :introduction, :price, :genre, :is_soldout)
		
	end


end
