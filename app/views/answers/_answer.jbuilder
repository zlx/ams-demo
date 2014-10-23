json.cache! answer do
  json.(answer, :content)
  json.user do
    json.partial! 'user', user: user
  end
end
