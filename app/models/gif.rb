class Gif < ActiveRecord::Base


validates :image_url, presence: true
validates :user_id, presence: true

belongs_to :user
has_many :comments, dependent: :destroy
has_and_belongs_to_many :tags

def remove_tag(tag)
		self.tags.destroy(tag) if self.tags.include? tag
	end

end



