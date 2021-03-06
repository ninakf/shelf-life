class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
  		@books = current_user.books.uniq
  	end

	def new
		@book = Book.new
		@shelves = current_user.shelves
	end

	def create 
		@book = Book.new(book_params)
		@shelves = current_user.shelves

		if @book.save
			BooksShelves.create(book_id: @book.id, shelf_id: params[:shelf_id])
			redirect_to '/'
		else 
			render :new
		end
	end

	def show
		@book = Book.find(params[:id])
		@shelves = current_user.shelves
	end

	def edit 
  		@book = current_user.books.find(params[:id])
  		@shelves = current_user.shelves
  	end

  	def update 
  		@book = current_user.books.find(params[:id])
  		@shelves = current_user.shelves

  		if @book.update_attributes(book_params)
  		redirect_to '/'
  		else 
  		render :edit
  		end
  	end

  	def destroy
  		@book = Book.find(params[:id])
  		@book.destroy
  		redirect_to '/'
	end

	def book_params
		params.require(:book).permit(
			:book_name, :book_author, :notes, shelf_ids: []
		)
	end
end