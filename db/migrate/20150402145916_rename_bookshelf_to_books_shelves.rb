class RenameBookshelfToBooksShelves < ActiveRecord::Migration
  def change
  	rename_table :book_shelf, :books_shelves
  end
end
