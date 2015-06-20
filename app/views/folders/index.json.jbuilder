json.array!(@folders) do |folder|
  json.extract! folder, :id, :name, :parent_id
  json.url folder_url(folder, format: :json)
end
