class Public::SweetsController < ApplicationController

	def top
		@genre = Genre.all
	end

	def about
	end

	def index
		@genre = Genre.all
		@sweet = Sweet.all
	end

	def show
		@genre = Genre.all
		@sweet = Sweet.find(params[:id])
	end

	def genre
		
	end

	private

	def sweet_params
		params.require(:sweet).permit(:name, :introduction, :price, :genre, :is_soldout)
		
	end

	def genre_params
		params.require(:genre).permit(:name)
	end
end
