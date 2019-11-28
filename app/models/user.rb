class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :safeguardings, dependent: :destroy
  has_many :charity_supports, dependent: :destroy
  has_many :residents, through: :safeguardings
  has_many :charities, through: :charity_supports
  has_one_attached :photo
  has_many :chats, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar_url_or_default
    if photo.attached?
      photo.key
    else
      "unsplash.jpg"
    end
  end


  def chatrooms
    Chatroom.where(sender: self).or(Chatroom.where(recipient: self))
  end

end
