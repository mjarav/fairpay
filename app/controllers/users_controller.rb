class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @my_services = Service.where(user_id: params[:id])
  end
end
