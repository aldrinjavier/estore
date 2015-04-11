class CategoriesController < ApplicationController

	def new 
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "#{@category.name} has been added to categories"
			redirect_to current_user
		else
			render 'new'
		end
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
