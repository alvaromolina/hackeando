json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :title, :detail, :entity_id
  json.url complaint_url(complaint, format: :json)
end
