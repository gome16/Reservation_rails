class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  attachment :image

  def self.search_area(area)
     where(["address like?", "%#{area}%"])  
  end
 
  def self.search(keyword) 
    where(["roomname like? OR price like? OR detail like? OR address like?","%#{keyword}%","%#{keyword}%","%#{keyword}%","%#{keyword}%"]) 
  end

end
