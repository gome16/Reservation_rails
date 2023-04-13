class AddPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :price, :integer
    add_column :reservations, :detail, :string
    add_column :reservations, :address, :string
  end
end
