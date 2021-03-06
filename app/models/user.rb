class User < ActiveRecord::Base

validates :username, presence: true, uniqueness: true
validates :profile_picture_id, presence: true
validates :bio, presence: true
has_secure_password

has_one :profile_pictures
has_many :comments, dependent: :destroy
has_many :gifs, dependent: :destroy

end
