class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :check_in
      t.integer :check_out
      t.integer :number

      t.timestamps
    end
  end
end
