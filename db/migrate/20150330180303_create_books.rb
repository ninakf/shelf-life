class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :book_author
      t.string :notes

      t.timestamps null: false
    end
  end
end
