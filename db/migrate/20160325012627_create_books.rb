class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :titleKana
      t.string :subTitle
      t.string :seriesName
      t.string :author
      t.string :authorKana
      t.string :publisherName
      t.string :language
      t.date :salesDate
      t.string :itemNumber
      t.string :koboGenreId
      t.string :itemCaption
      t.integer :itemPrice
      t.string :itemUrl
      t.string :affiliateUrl
      t.string :smallImageUrl
      t.string :mediumImageUrl
      t.string :largeImageUrl
      t.string :reviewCount
      t.string :reviewAverage
      t.integer :salesType

      t.timestamps null: false
    end
  end
end
