class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy]
  before_action :require_authorization!, only: [:destroy]

  def index
    @rooms = Room.all
    @room = Room.new
  end

  def show
  end

  def create
    @room = current_user.rooms.create!

    redirect_to @room, notice: 'Room was successfully created.'
  end

  def destroy
    @room.destroy

    redirect_to root_path, notice: 'Room was successfully deleted.'
  end


  private

  def set_room
    @room = Room.find_by(token: params[:token])
  end

  def require_authorization!
    unless current_user == @room.user
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
