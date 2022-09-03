class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.customer = current_user
    @chatroom.provider = User.find(params[:provider])
    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end
end
