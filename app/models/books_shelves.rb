class BooksShelves < ActiveRecord::Base
  belongs_to :books
  belongs_to :shelves
end


