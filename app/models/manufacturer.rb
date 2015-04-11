class Manufacturer < ActiveRecord::Base
	has_many :stock_items

	validates :id, presence: true
end
