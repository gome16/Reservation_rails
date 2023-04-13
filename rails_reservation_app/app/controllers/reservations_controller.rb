class ReservationsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def index
  end

  def show
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      render template: "rooms/show"
      return
    end
   
  end

  def create
    @reservation = Reservation.new(reservation_params)
    render template: "rooms/show"  and return if params[:back] || !@reservation.save
    redirect_to @reservation
  end 

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number, :room_id, :user_id, :roomname)
  end
  
end
 