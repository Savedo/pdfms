json.array!(@selectors) do |selector|
  json.extract! selector, :id, :slug, :name, :tags
  json.url selector_url(selector, format: :json)
end
