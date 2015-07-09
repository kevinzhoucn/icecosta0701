json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :content, :activity_type
  json.url activity_url(activity, format: :json)
end
