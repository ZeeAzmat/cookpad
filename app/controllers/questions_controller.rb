class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = 
      if (params[:q])
        Question.where('body LIKE ?', '%' + params[:q] + '%').includes(:user, answers: :user).order('created_at DESC')
      else    
        Question.all.includes(:user, answers: :user).order('created_at DESC')
      end
    binding.pry
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to controller: 'questions', action: 'index', notice: 'Question was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to controller: 'questions', action: 'index', notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body).merge!(user_id: current_user.id)
    end
end
