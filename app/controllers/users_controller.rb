class UsersController < ApplicationController
  def ams
    @users = User.limit(30)
    render json: @users, each_serializer: UserSerializer
  end

  def jbuilder
    @users = User.limit(30)
  end
end
