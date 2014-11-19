class User < ActiveRecord::Base

validates :username, presence: true, uniqueness: true
validates :profile_pic, presence: true
validates :bio, presence: true
has_secure_password

has_many :comments, dependent: :destroy
has_many :gifs, dependent: :destroy

end
