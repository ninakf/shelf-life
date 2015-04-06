class BooksController < ApplicationController

	def new
		@book = Book.new
		@shelves = current_user.shelves
	end

	def create 
		@book = Book.new(book_params)

		if @book.save
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
			:book_name, :book_author, :description
			)
	end
end