json.array!(@pictures) do |picture|
  json.extract! picture, :id, :key, :value
  json.url picture_url(picture, format: :json)
end
