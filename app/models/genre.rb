class Genre < ActiveRecord::Base
  has_many :books
  validates :strId, presence: true, uniqueness: true

  def delete_old
    self.books.each{|item|
      item.delete if (Date.today - item.salesDate) > ELAPSED_DAYS
    }
  end

  def self.get_summary
    url = RAKUTEN_GENRE_URI + '20131010'
    params = {:format => 'json', :koboGenreId => 101, :applicationId => KOBOAPI_APPLICATION_ID}
    results = exec_api(url, params)
    results["children"].each_with_index{|item, i|
      Genre.create(
        :strId => item["child"]["koboGenreId"],
        :name => item["child"]["koboGenreName"],
        :level => item["child"]["genreLevel"]
      )
    }
  end

  def get_books_summary
    url = RAKUTEN_KWL_URI + '20140811'
    params = {:format => 'json', :koboGenreId => self.strId, :sort => '-releaseDate', :salesType => 0, :applicationId => KOBOAPI_APPLICATION_ID}
    results = Genre.exec_api(url, params)
    results["Items"].each_with_index{|item, i|
      self.books.create(
        :title => item["Item"]["title"],
        :titleKana => item["Item"]["titleKana"],
        :subTitle => item["Item"]["subTitle"],
        :seriesName => item["Item"]["seriesName"],
        :author => item["Item"]["author"],
        :authorKana => item["Item"]["authorKana"],
        :publisherName => item["Item"]["publisherName"],
        :language => item["Item"]["language"],
        :salesDate => Date.strptime(item["Item"]["salesDate"], "%Y年%m月%d日"),
        :itemNumber => item["Item"]["itemNumber"],
        :koboGenreId => item["Item"]["koboGenreId"],
        :itemCaption => item["Item"]["itemCaption"],
        :itemPrice => item["Item"]["itemPrice"],
        :itemUrl => item["Item"]["itemUrl"],
        :affiliateUrl => item["Item"]["affiliateUrl"],
        :smallImageUrl => item["Item"]["smallImageUrl"],
        :mediumImageUrl => item["Item"]["mediumImageUrl"],
        :largeImageUrl => item["Item"]["largeImageUrl"],
        :reviewCount => item["Item"]["reviewCount"],
        :reviewAverage => item["Item"]["reviewAverage"],
        :salesType => item["Item"]["salesType"]
      )
    }
  end

  private
  def self.exec_api(url, params)
    params = params.to_a.map() do |item|
      [item.first.to_s, CGI.escape(item.last.to_s)]
    end.sort
    param_string = params.map() {|key, value| "#{key}=#{value}"}.join('&')
    base_string = ['GET', CGI.escape(url), CGI.escape(param_string)].join('&')
    uri_string = url + '?' + param_string

    Net::HTTP.version_1_2
    uri = URI.parse(uri_string)
    json = Net::HTTP.get(uri)
    results = JSON.parse(json)

  end

end
