class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :shelf_name
      t.string :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :shelves, :users
  end
end
