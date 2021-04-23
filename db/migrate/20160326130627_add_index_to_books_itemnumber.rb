class AddIndexToBooksItemnumber < ActiveRecord::Migration
  def change
    add_index :books, :itemNumber, unique: true
  end
end
