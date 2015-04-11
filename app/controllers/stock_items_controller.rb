class StockItemsController < ApplicationController

	def new 
		@stock_item = StockItem.new
	end

	def create
		@stock_item = StockItem.new(item_params)
		if @stock_item.save
			flash[:success] = "#{@stock_item.title} has been added to categories"
			redirect_to current_user
		else
			render 'new'
		end
	end

	def index
		@stock_items = StockItem.all
	end

	def destroy
		@item_to_destroy = StockItem.find(params[:id]).destroy
		flash[:success] = "#{@item_to_destroy.title} has been destroyed"
		redirect_to stock_items_url
	end

	def edit
		@stock_item = StockItem.find(params[:id])
	end

	def update
		@stock_item = StockItem.find(params[:id])
		if @stock_item.update_attributes(item_params)	
			flash[:success] = "#{@stock_item.title} has been updated"
			redirect_to stock_items_url
		else
			render 'edit'
		end
	end

	def show 
		@stock_item = StockItem.find(params[:id])
	end

	private
	def item_params
		params.require(:stock_item).permit(:title, :description, :price, :manufacturer_id, :category_id, :current_stock_level)
	end
end
