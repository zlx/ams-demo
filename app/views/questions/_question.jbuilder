json.cache! [question, question.user] do
  json.(question, :title, :content, :created_at, :updated_at)
  json.random sleep(0.1)
  json.user do
    json.partial! 'users/user', user: question.user
  end
end
