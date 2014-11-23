class UsersController < ApplicationController


	#Show all active users in the system. We can make them all selectable to see
	#their profiles and gifs specifically. **NEEDS / HAS VIEW
	def index
		@users = User.all
	end

	#Show the users individual page. Will have the profile pic, all gifs
	#a short bio HAS VIEW
	def show
		@user = User.find(params[:id])
		#@tags = Tags.all
	end

	#Sign up page / Home landing page / should have a sign up form
	#log in form if already signed up HAS VIEW

	def new
		@user = User.new
	end

	#Post route for the user new page / should redirect to the users specific page
	def create
		@user = User.new(user_params)
		if @user.save
			session[:current_user_id] = @user.id
			redirect_to user_path(session[:current_user_id])
		else
			render :new
		end
	end

	#accesable only through your indiviudal profile page / ability to delete your
	#own gifs and edit your profile info  HAS VIEW
	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(session[:current_user_id])
		end
	end

	#put route for the edit route
	def update
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(session[:current_user_id])
		else
			if @user.update(user_params)
				redirect_to user_path(@user)
			else
				render :edit
			end
		end
	end

	#delete route for the user / ability to delete all their info including any comments
	# gifs
	def destroy
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(session[:current_user_id])
		else
		session[:current_user_id] = nil
		if @user.destroy
			redirect_to new_user_path
		else
			redirect_to user_path(@user)
		end
	end
	end

	private

	#params for the new user form.
	def user_params
		params.require(:user).permit(:username, :profile_picture_id, :bio, :password)
	end

end
