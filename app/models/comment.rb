class Comment < ActiveRecord::Base

	validates :comment, presence: true

belongs_to :gif
belongs_to :user

end