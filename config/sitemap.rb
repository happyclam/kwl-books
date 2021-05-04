# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://kwl-books.herokuapp.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  # add '/', :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  # Genres.find_each do |genre|
  #   add genre_path(genre), :changefreq => 'always', :lastmod => genre.updated_at
  # end
  add 'genres/1', :changefreq => 'always'
  add 'genres/2', :changefreq => 'always'
  add 'genres/3', :changefreq => 'always'
  add 'genres/4', :changefreq => 'always'
  add 'genres/5', :changefreq => 'always'
  add 'genres/6', :changefreq => 'always'
  add 'genres/7', :changefreq => 'always'
  add 'genres/8', :changefreq => 'always'
  add 'genres/9', :changefreq => 'always'
  add 'genres/10', :changefreq => 'always'
  add 'genres/11', :changefreq => 'always'
  add 'genres/12', :changefreq => 'always'
  add 'genres/13', :changefreq => 'always'
  add 'genres/14', :changefreq => 'always'
  add 'genres/15', :changefreq => 'always'
  add 'genres/16', :changefreq => 'always'
  add 'genres/17', :changefreq => 'always'
  add 'genres/18', :changefreq => 'always'
  add 'genres/19', :changefreq => 'always'

end
