class Admin::SweetsController < ApplicationController

	def index
	end

	def new
		@sweet = Sweet.new
	end

	def create
		@sweet = Sweet.new(sweet_params)
		@sweet.save
		redirect_to root_path
	end

	def show
	end

	def edit
	end

	def update
	end

	private
	def sweet_params
		params.require(:sweet).permit(:name, :introduction, :price, :genre)
		
	end


end
