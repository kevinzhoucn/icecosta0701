json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :image_url
  json.url slide_url(slide, format: :json)
end
