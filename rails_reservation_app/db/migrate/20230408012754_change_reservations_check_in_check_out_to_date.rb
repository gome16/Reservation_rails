class ChangeReservationsCheckInCheckOutToDate < ActiveRecord::Migration[6.1]
  def up
    change_column :reservations, :check_in, :date, using: "reservations::date"
    change_column :reservations, :check_out, :date, using: "reservations::date"
  end

  def down 
    change_column :reservations, :check_in, :integer, using: "reservations::integer"
    change_column :reservations, :check_out, :integer, using: "reservations::integer"
  end

end
