require 'rails_helper'

describe Tag do 

	it { is_expected.to validate_presence_of :name}
	it { is_expected.to have_and_belong_to_many :gifs}

end
