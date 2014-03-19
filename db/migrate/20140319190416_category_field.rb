class CategoryField < ActiveRecord::Migration
  def up
  	add_column("uploads", "category", :string)
  end

  def down
  	remove_column("uploads", "category", :string)
  end
end
