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
    flash[:notice] = "Upvote added to" + " " + @question.option_a
    redirect_to :back
  end


  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    flash[:notice] = "Upvote added to" + " " + @question.option_b
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
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url}
      format.js
    end
  end

private
  def question_params
    params.require(:question).permit(:option_a, :option_b)
  end

end
