class AddCurrentStockLevelToStockItem < ActiveRecord::Migration
  def change
  	add_column :stock_items, :current_stock_level, :integer
  end
end
