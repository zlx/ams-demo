json.cache! question do
  json.(question, :title, :content)
  json.user do
    json.partial! 'user', user: question.user
  end
end
