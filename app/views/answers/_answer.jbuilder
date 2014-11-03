json.cache! [answer, answer.user, answer.question] do
  json.(answer, :content, :created_at, :updated_at)
  json.random sleep(0.1)
  json.user do
    json.partial! 'users/user', user: answer.user
  end
  json.question do
    json.partial! 'questions/question', question: answer.question
  end
end
