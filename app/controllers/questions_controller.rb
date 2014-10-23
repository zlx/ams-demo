class QuestionsController < ApplicationController
  def ams
    @questions = Question.limit(30)
    render json: @questions, each_serializer: QuestionSerializer
  end

  def jbuilder
    @questions = Question.limit(30)
  end
end
