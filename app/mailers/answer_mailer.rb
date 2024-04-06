class AnswerMailer < ApplicationMailer
  def notice_answer
    @user = params[:user]
    @question = params[:question]
    mail(to: @user.email, subject: '質問に回答がつきました')
  end

  def notice_related_answer
    @user = params[:user]
    @question = params[:question]
    mail(to: @user.email, subject: 'あなたが回答した質問に新たな回答がつきました')
  end
end
