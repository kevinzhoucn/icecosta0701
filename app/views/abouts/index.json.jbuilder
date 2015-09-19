json.array!(@abouts) do |about|
  json.extract! about, :id, :title, :content, :lang
  json.url about_url(about, format: :json)
end
