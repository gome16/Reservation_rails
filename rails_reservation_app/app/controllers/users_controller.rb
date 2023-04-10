class UsersController < ApplicationController
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def account
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "#{@user.id}の情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :username, :profile)
  end

  def search_params
    params.require(:q).permit!
  end

end
