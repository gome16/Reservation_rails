class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    render template: "rooms/show" if @reservation.invalid?
  end

  def create
    @reservation = Reservation.new(reservation_params)
    render template: "rooms/show"  and return if params[:back] || !@reservation.save
    redirect_to @reservation
  end 

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number, :room_id, :user_id)
  end
  
end
 