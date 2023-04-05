class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:roomname, :detail, :price,:address, :image))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to room_path(@room)
    else
      render"new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:roomname, :detail,  :price, :address, :image))
    redirect_to room_path(@room)
    else
      render"edit"
    end
  end
end
