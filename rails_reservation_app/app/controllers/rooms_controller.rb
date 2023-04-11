class RoomsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:roomname, :detail, :price,:address, :image))
    @room.id = current_user.id
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to room_path(@room)
    else
      render"new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to room_path, alert: '不正なアクセスです'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:roomname, :detail, :price, :address, :image))
    redirect_to room_path(@room)
    else
      render"edit"
    end
  end

  def search 
    if params[:area].present?
      @rooms = Room.search_area(params[:area])
      render'index'
    elsif params[:keyword].present?
      @rooms = Room.search(params[:keyword])
      render'index'
    else
    end
  end
end

