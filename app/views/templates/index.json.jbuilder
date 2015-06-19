json.array!(@templates) do |template|
  json.extract! template, :id, :slug, :name, :tags
  json.url template_url(template, format: :json)
end
