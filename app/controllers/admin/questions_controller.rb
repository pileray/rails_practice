class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.all.page(params[:page]).per(5)
  end

  def destroy
    @question = Question.find(params[:id])
    title = @question.title
    @question.destroy!
    flash[:success] = "タイトル：#{title}を削除しました"
    redirect_to admin_questions_path
  end
end
