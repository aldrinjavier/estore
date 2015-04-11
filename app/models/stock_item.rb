class StockItem < ActiveRecord::Base
	belongs_to :category 
	belongs_to :manufacturer 
	has_many :comments
	before_validation { self.title = title.downcase }
	validates :title, presence: true, :uniqueness => true
	validates :description, presence: true, length: { minimum: 3 }
	validates :price, presence: true
	validates :category_id, presence: true
	validates :manufacturer_id, presence: true
	validates :current_stock_level, presence: true

end
