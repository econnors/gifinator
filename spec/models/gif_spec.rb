require 'rails_helper'

describe Gif do 

	it { is_expected.to validate_presence_of :title}
	#it { is_expected.to validate_presence_of :gif}
	it { is_expected.to validate_presence_of :user_id}
	it { is_expected.to belong_to :user}
	it { is_expected.to have_many :comments}
	it { is_expected.to have_and_belong_to_many :tags}
  
end