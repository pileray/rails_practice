class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    name = @user.name
    @user.destroy!
    flash[:success] = "ユーザー：#{name}を削除しました"
    redirect_to admin_users_path
  end
end
