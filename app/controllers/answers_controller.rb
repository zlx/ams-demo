class AnswersController < ApplicationController
  def ams
    @answers = Answer.limit(30)
    render json: @answers, each_serializer: AnswerSerializer
  end

  def jbuilder
    @answers = Answer.limit(30)
  end
end
