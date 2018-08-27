class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    
  end

  # !(如果使用者 == 現在的使用者)  跳回編輯頁面 
  def edit  
    unless @user == current_user  
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro)    
  end  

end
