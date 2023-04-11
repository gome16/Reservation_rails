class ReservationsController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def index
  end

  def show
    @reservations = Reservation.all
    @room = Room.find_by(params[:id])
  end

  def new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])
    render template: "rooms/show" if @reservation.invalid?
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
 