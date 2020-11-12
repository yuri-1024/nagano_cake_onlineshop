class Admin::SweetsController < ApplicationController

	before_action :authenticate_admin!

	def index
		@sweets = Sweet.all

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
		@genre = @sweet.genre
	end

	def edit
		@sweet = Sweet.find(params[:id])
	end

	def update
		@sweet = Sweet.find(params[:id])
		@sweet.update(sweet_params)
		redirect_to admin_sweet_path(@sweet.id)
	end

	private
	def sweet_params
		params.require(:sweet).permit(:image, :name, :introduction, :genre_id, :price, :is_soldout)
	end


end
