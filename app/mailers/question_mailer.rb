class QuestionMailer < ApplicationMailer
  def notice_question
    @user = params[:user]
    @question = params[:question]
    mail(to: @user.email, subject: '新たな質問が追加されました')
  end
end
