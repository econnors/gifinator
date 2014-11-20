require 'rails_helper'

describe Comment do 

	it { is_expected.to validate_presence_of :comment}
	it { is_expected. to belong_to :gif}

	it { is_expected. to belong_to :user}

end
