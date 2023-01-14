class UsersController < ApplicationController
  before_action :authenticate_user!
  def account
    @user = current_user
  end
  def profile
    @user = current_user
  end

  def login
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @user = current_user

    end
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name ,:profile))
      flash[:notice]="更新しました"
      redirect_back(fallback_location: users_profile_path)
    else
      flash.now[:notice]="更新に失敗してしまいました、再入力してください"
      redirect_back(fallback_location: users_profile_path)
    end
end
end