class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations
  has_many :rooms

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, :trackable
  
  mount_uploader :profile_image_id, ImageUploader

end
