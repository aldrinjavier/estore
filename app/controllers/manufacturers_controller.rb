class ManufacturersController < ApplicationController

	def new 
		@manufacturer = Manufacturer.new
	end

	def create
		@manufacturer = Manufacturer.new(manufacturer_params)
		if @manufacturer.save
			flash[:success] = "#{@manufacturer.name} has been added in manufacturers"
			redirect_to current_user
		else
			render 'new'
		end
	end

	private
	def manufacturer_params
		params.require(:manufacturer).permit(:name)
	end
end
