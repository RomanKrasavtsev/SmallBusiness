json.array!(@clients) do |client|
  json.extract! client, :id, :description
  json.url client_url(client, format: :json)
end
