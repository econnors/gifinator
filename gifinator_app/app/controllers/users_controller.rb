class UsersController < ApplicationController


#Show all active users in the system. We can make them all selectable to see
#their profiles and gifs specifically. **NEEDS / HAS VIEW
	def index
		@users = User.all
	end

#Show the users individual page. Will have the profile pic, all gifs
#a short bio **NEEDS / HAS VIEW
	def show
		@user = User.find(params[:id])
	end

#Sign up page / Home landing page / should have a sign up form 
#log in form if already signed up **NEEDS / HAS VIEW

	def new
		@user = User.new
	end

#Post route for the user new page / should redirect to the users specific page
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user)
		else 
			render :new
	end

#accesable only through your indiviudal profile page / ability to delete your
#own gifs and edit your profile info **NEEDS / HAS VIEW
	def edit
		@user = User.find(params[:id])
	end

#put route for the edit route
	def update
		@user = User.find(params[:id])
			if @user.update(user_params)
				redirect_to user_path(@user)
			else
				render :edit
			end
	end

#delete route for the user / ability to delete all their info including any comments
# gifs 
	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to gifs_path
		else
			redirect_to user_path(@user)
	end

	private

#params for the new user form. 
	def user_params
		params.require(:user).permit(:username, :profile_pic, :password_digest)
	end

end
