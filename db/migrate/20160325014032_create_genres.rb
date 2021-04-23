class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :strId
      t.string :name
      t.integer :level

      t.timestamps null: false
    end
  end
end
