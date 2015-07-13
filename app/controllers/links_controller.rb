class LinksController < ApplicationController
  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to questions_path
  end
end
