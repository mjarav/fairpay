class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @my_services = Service.where(user_id: params[:id])
  end

  def edit
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :photo)
  end
end
