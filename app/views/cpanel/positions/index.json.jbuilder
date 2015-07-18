json.array!(@positions) do |position|
  json.extract! position, :id, :title, :content, :position_type
  json.url position_url(position, format: :json)
end
