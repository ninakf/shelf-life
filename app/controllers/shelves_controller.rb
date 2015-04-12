class ShelvesController < ApplicationController
	before_action :authenticate_user!

	def index
		@shelves = current_user.shelves 
	end

	def new
		@shelf = Shelf.new
	end

	def create 
		@shelf = Shelf.new(shelf_params)
		@shelf.user = current_user

		if @shelf.save
			redirect_to '/'
		else 
			render :new
		end
	end

	def show
		@shelf = Shelf.find(params[:id])
		@books = @shelf.books
	end

	def edit 
  		@shelf = current_user.shelves.find(params[:id])
  	end

  	def update 
  		@shelf = current_user.shelves.find(params[:id])

  	if @shelf.update_attributes(shelf_params)
  		redirect_to '/'
  	else 
  		render :edit
  	end
  	end

  	def destroy
  		@shelf = Shelf.find(params[:id])
  		@shelf.destroy
  		redirect_to '/'
	end

  	private

	def shelf_params
		params.require(:shelf).permit(
			:shelf_name, :description
			)
	end
end