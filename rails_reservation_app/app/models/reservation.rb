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

  validate :start_end_check

  def start_end_check
    unless check_in == nil
    errors.add(:check_out, "は開始日より後のものを選択してください") unless
    self.check_in < self.check_out
    end
  end

end
