class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
		@shelves = current_user.shelves
	end

	def create 
		@book = Book.new(book_params)

		if @book.save
			BooksShelves.create(book_id: @book.id, shelf_id: params[:shelf_id])
			redirect_to '/'
		else 
			render :new
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(
			:book_name, :book_author, :notes
		)
	end
end