json.cache! user do
  json.(user, :name, :created_at, :updated_at)
  json.random sleep(0.1)
end
