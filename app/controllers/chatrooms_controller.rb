class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(provider: current_user).or(Chatroom.where(customer: current_user))
    ## @chatrooms = @chatrooms.sort { |a, b| (b.messages.last['created_at']) <=> (a.messages.last['created_at']) }
    @chatrooms = @chatrooms.sort_by{ |c| c.messages.last&.try(:[], 'created_at') || Date.today - 1.year }.reverse
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    name = [current_user.id, User.find(params[:provider]).id].sort
    @chatroom = Chatroom.where(name: "#{name[0]}-#{name[1]}")

    if @chatroom.length.positive?
      redirect_to chatroom_path(@chatroom[0])
    else
      @chatroom = Chatroom.new
      @chatroom.customer = current_user
      @chatroom.provider = User.find(params[:provider])
      @chatroom.name = "#{name[0]}-#{name[1]}"
      @chatroom.save

      redirect_to chatroom_path(@chatroom)
    end
  end
end
