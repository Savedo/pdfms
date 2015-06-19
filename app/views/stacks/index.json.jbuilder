json.array!(@stacks) do |stack|
  json.extract! stack, :id, :slug, :name, :tags
  json.url stack_url(stack, format: :json)
end
