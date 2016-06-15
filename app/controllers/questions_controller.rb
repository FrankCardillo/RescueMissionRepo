class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(best: :desc)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = "Question successfully added."
      redirect_to questions_path(@questions)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      @questions = Question.order(created_at: :desc)
      render :index
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(', ')
      render 'questions/show'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:asker, :title, :body)
  end
end
