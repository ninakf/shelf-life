class ShelvesController < ApplicationController
	def new
		@shelf = Shelf.new
	end

	def create 
		@shelf = Shelf.new(shelf_params)

		if @shelf.save
			redirect_to '/'
		else 
			render :new
		end
	end

	def shelf_params
		params.require(:shelf).permit(
			:shelf_name, :description
			)
	end
end