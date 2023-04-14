class AddImageIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :image_id, :string
  end
end
