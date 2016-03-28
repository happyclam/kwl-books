json.array!(@genres) do |genre|
  json.extract! genre, :id, :strId, :name, :level
  json.url genre_url(genre, format: :json)
end
