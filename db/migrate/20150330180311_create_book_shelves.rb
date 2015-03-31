class CreateBookShelves < ActiveRecord::Migration
  def change
    create_table :book_shelves do |t|
      t.references :book, index: true
      t.references :shelf, index: true

      t.timestamps null: false
    end
    add_foreign_key :book_shelves, :books
    add_foreign_key :book_shelves, :shelves
  end
end
