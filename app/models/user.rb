class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :image
         validates :name, presence: true
         validates :email, uniqueness: true, presence: true

  has_many :rooms
  has_many :reservations
end
