class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:success] = "Answer Saved Successfully"
      redirect_to question_path(@question)
    else
      flash[:errors] = @answer.errors.full_messages.join(', ')
      @answers = @question.answers
      @answer = Answer.new(answer_params)
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answerer, :body)
  end

end
