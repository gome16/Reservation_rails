class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  with_options presence: true do
    validates :user_id
    validates :room_id
    validates :check_in
    validates :check_out
    validates :number
  end
  validates :number,numericality:true

end
