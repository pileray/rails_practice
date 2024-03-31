class QuestionsController < ApplicationController
  def index
    debugger
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true)
  end

  def solved
    @q = Question.where(solved: true).ransack(params[:q])
    @questions = @q.result(distinct: true)
    render :index
  end

  def unsolved
    @q = Question.where(solved: false).ransack(params[:q])
    @questions = @q.result(distinct: true)
    render :index
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
  end

  def new
    @question = Question.new
  end

  def create
    @question= current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "質問投稿しました"
      redirect_to question_path(@question)
    else
      flash.now[:danger] = "失敗しました #{@question.errors.full_messages}"
      render :new
    end
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "編集しました"
      redirect_to question_path(@question)
    else
      flash.now[:danger] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy!
    flash[:success] = '削除しました。'
    redirect_to questions_path
  end

  def solve
    @question = current_user.questions.find(params[:id])
    @question.update(solved: true)
    flash[:success] = "解決済にしました"
    redirect_to question_path(@question)
  end

  private
  def question_params
    params.require(:question).permit(:title, :body)
  end

end
