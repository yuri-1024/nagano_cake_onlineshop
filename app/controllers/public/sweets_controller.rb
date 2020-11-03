class Public::SweetsController < ApplicationController

	def top
		@genre = Genre.all
		if params[:genre_sort]
			@sweets = Sweet.where(genre_id: params[:genre_sort])
		else
			@sweets = Sweet.all
		end
	end

	def about
	end

	def index
		@genres = Genre.all
		if params[:genre_sort]
			@sweets = Sweet.where(genre_id: params[:genre_sort])
			@sweet_index_title = @sweet.genre.name + "一覧"

		else
			@sweet_index_title = "商品一覧"
			@sweets = Sweet.all
		end
	end

	def show
		@genre = Genre.all
		@sweet = Sweet.find(params[:id])
		@cart = Cart.new
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
