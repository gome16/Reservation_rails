class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :roomname, :string
  end
end
