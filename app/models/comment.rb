class Comment < ActiveRecord::Base
	belongs_to :stock_item
	belongs_to :user
	validates :comment_text, presence: true
	default_scope -> { order('created_at DESC') }
end
