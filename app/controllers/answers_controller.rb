class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params.merge(question_id: params[:question_id]))
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      flash[:danger] = "失敗しました #{@answer.errors.full_messages}"
      redirect_to question_path(params[:question_id])
    end
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
    redirect_to @answer.question
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
