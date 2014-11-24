class Tag < ActiveRecord::Base

	validates :name, presence: true

has_and_belongs_to_many :gifs

before_save { |tag| tag.name = tag.name.downcase}

end