class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @questions, notice: "Question successfully created"
    else
      flash[:notice] = "You must fill out all fields to submit a question."
      redirect_to @questions
    end
  end
end
