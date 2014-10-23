class QuestionSerializer < ActiveModel::Serializer
  cached true

  attributes :title, :content, :created_at, :updated_at, :random
  has_one :user, serializer: UserSerializer

  def cache_key
    object
  end

  def random
    sleep 0.1
  end
end
