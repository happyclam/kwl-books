json.array!(@books) do |book|
  json.extract! book, :id, :title, :titleKana, :subTitle, :seriesName, :author, :authorKana, :publisherName, :language, :salesDate, :itemNumber, :koboGenreId, :itemCaption, :itemPrice, :itemUrl, :affiliateUrl, :smallImageUrl, :mediumImageUrl, :largeImageUrl, :reviewCount, :integer, :reviewAverage, :salesType
  json.url book_url(book, format: :json)
end
