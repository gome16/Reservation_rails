class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
  end

  def create

  end
  def confirm
    @reservation = Reservation.new(@attr)
    @reservation.user_id = current_user.id 
    if @reservation.invalid?
      render template: 'rooms/show'

    end
  end

  private

  def permit_params
    @attr = params.require(:reservation).permit(:check_in, :check_out, :number, :room_id, :user_id)
  end
  
end
 