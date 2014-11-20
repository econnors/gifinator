require 'rails_helper' 

describe User do

let(:emily) {User.new(username: 'econnors',
											profile_picture_id: 'http://lorempixel.com/200',
											bio: 'im da bes, swag swag swag',
											password: 'password1',
											password_confirmation: 'password1')}

  it "is valid with a username, profile_pic, bio, and password" do
    expect(emily).to be_valid
  end

  it "is invalid without a username" do
  	new_user = User.new(username: nil)
  	expect(new_user).to have(1).errors_on(:username)
  end

  it "is invalid without a profile_pic" do
  	new_user = User.new(profile_pic: nil)
  	expect(new_user).to have(1).errors_on(:profile_pic)
  end

  it "is invalid without a bio" do
  	new_user = User.new(bio: nil)
  	expect(new_user).to have(1).errors_on(:bio)
  end

  it "must have matching password and password_confirmation" do
  	new_user = User.new(username: 'will',
  											profile_picture_id: 'http://lorempixel.com/200',
  											bio: 'im da bes, swag swag swag',
  											password: 'password2',
  											password_confirmation: 'password3')
  	error_included = errors.include?("doesn't match password")
  	expect(error_included).to eq(true)
  end

  it "is invalid without a unique username" do
  	emily.save!
  	maggie = User.new(username: 'will',
  										profile_picture_id: 'http://lorempixel.com/200',
  										bio: 'im da bes, swag swag swag',
  										password: 'password3',
  										password_confirmation: 'password3')
  	expect(mck).to have(1).errors_on(:username)
  end

  it { is_expected.to have many :gifs}
  it { is_expected.to have many :comments}

end