class CommentsController < ApplicationController
	def create
		@stock_item = StockItem.find(params[:stock_item_id])
		@comment = @stock_item.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Your comment has been posted"
			redirect_to @stock_item
		else
			render 'static_pages/home'
		end
	end

	def comment_params
		params.require(:comment).permit(:comment_text)
	end
end
