class Comment < ActiveRecord::Base
	belongs_to :stock_item
	belongs_to :user
end
