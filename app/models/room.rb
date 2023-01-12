class Room < ApplicationRecord
  has_one_attached :image
  validates :room_name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :introduction, presence: true

  def self.room_serach(search)
   Room.where(['title LIKE ?', "%#{search}%"])
end

has_many :reservations
belongs_to :user,optional: true
end
