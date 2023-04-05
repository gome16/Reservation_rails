class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  
  def conform
    
  end

  def new
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
    
  end

  def create
    @room = Room.find(params[:id])
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number, :user_id, :room_id))
    @reservation.user_id = current_user.id
    @reservation.room_id = Reservation.find(params[:reservation][:room_id])
    
    if @reservation.save
      flash[:notice] = "予約完了しました"
    else
      render"new"
    end
  end

  def update
  end
  
end
 