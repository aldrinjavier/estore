class CreateStockItems < ActiveRecord::Migration
	def change
		create_table :stock_items do |t|

			t.string :title
			t.string :description
			t.integer :price
			t.integer :category_id #FK
			t.integer :manufacturer_id #FK
		end
	end
end
