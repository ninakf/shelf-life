class RenameBookshelfToBooksShelves < ActiveRecord::Migration
  def change
  	rename_table :book_shelves, :books_shelves
  end
end
