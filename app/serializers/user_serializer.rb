class UserSerializer < ActiveModel::Serializer
  cached true
  attributes :name, :created_at, :updated_at, :random

  def cache_key
    object
  end

  def random
    sleep 0.1
  end
end
