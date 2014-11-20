class Gif < ActiveRecord::Base

validates :title, presence: true
validates :gif, presence: true
validates :user_id, presence: true

belongs_to :user
has_many :comments, dependent: :destroy
has_and_belongs_to_many :tags

end