class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def updat
    if @user.update(user_params)
      redirect_to root_path, success: '更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :age, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to root_path, warning: "権限がありません"
    end
  end
end
