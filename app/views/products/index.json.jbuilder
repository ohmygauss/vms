json.array!(@products) do |product|
  json.extract! product, :id, :name, :vulnerability
  json.url product_url(product, format: :json)
end
