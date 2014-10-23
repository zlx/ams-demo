class AnswerSerializer < ActiveModel::Serializer
  cached true

  attributes :content, :created_at, :updated_at, :random
  has_one :user, serializer: UserSerializer
  has_one :question, serializer: QuestionSerializer

  def cache_key
    object
  end

  def random
    sleep 0.1
  end
end
