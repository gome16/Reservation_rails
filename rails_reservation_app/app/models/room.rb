class Room < ApplicationRecord
  belongs_to :user,optional: true
  has_many :reservations, dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :roomname
    validates :detail
    validates :price
    validates :address
  end
  validates :price,numericality:true


  def self.search_area(area)
     where(["address like?", "%#{area}%"])  
  end
 
  def self.search(keyword) 
    where(["roomname like? OR price like? OR detail like? OR address like?","%#{keyword}%","%#{keyword}%","%#{keyword}%","%#{keyword}%"]) 
  end


  def self.ransackable_associations(auth_object = nil)
    ["reservations", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "address", "price", "detail"]
  end

end
