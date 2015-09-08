json.array!(@likes) do |like|
  json.extract! like, :id, :complaint_id, :user_id, :email_id
  json.url like_url(like, format: :json)
end
