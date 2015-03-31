class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create 
		@book = Book.new(book_params)

		if @book.save
			redirect_to '/'
		else 
			render :new
		end
	end

	def book_params
		params.require(:book).permit(
			:book_name, :book_author, :description
			)
	end
end