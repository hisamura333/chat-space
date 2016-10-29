class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    if user.update_with_password(update_params)
      flash[:edit] = "ユーザー情報を編集しました"
      redirect_to controller: 'messages',action: 'index'
    else
      redirect_to action: 'edit'
      user.errors.full_messages.each do |message|
        flash[:error] = message
      end
    end
  end

  def index
    @searched_user = User.where('name LIKE ?', "%#{params[:name]}%")
    if @searched_user.present?
      render json: @searched_user
    else
    end
  end

  private
  def update_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:current_password)
    
  end
end
