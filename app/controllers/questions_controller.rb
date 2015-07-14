class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def upvote
    @question = Question.find(params[:id])

    @question.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    redirect_to :back
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      respond_to do |format|
        format.html { redirect_to '/' }
        format.js
      end
    else
      flash[:alert] = "There was an error!"
      render :new
    end
  end





private
  def question_params
    params.require(:question).permit(:option_a, :option_b)
  end

end
