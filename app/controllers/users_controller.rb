class UsersController < ApplicationController


	#======================
	#    ALL USERS PAGE
	#======================

	#Show all active users in the system. From here you can select any profile to view. 

	def index
		@users = User.all
		if session[:current_user_id] == nil
			redirect_to new_user_path
		end
	end

	#======================
	#  USER ACCOUNT PAGE
	#======================

	#Show the users individual page. Has profile pic, all gifs a short bio 
	#Allows users to delete gifs, tags, whole account from this view. 

	def show
		@user = User.find(params[:id])
		@show_delete_tag_buttons = true
	end

	#======================
	#  NEW USER SHOW PAGE
	#======================

	#This is the login page. Allows user to make an account. Landing page for the app.
	#Has a log in/log out button depending on the status of the session 

	def new
		@user = User.new
	end

	#========================
	#  NEW USER CREATE ROUTE
	#========================

	def create
		@user = User.new(user_params)
		if @user.save
			session[:current_user_id] = @user.id
			redirect_to user_path(session[:current_user_id])
		else
			render :new
		end
	end

	#======================
	#  EDIT USER SHOW PAGE
	#======================

  #A user can edit their profile picture, bio and username. 
  #Only accessible to individual if logged in. 

	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(session[:current_user_id])
		end
	end

	#=====================
	#  UPDATE USER ROUTE
	#=====================

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


  #=====================
	#    DELETE USER 
	#=====================

	#ability for only the user to be delete all their info including any comments
	# and gifs

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

	#================
	#   PARAMS
	#================

	#params for the new user form.

	def user_params
		params.require(:user).permit(:username, :profile_picture_id, :bio, :password, :password_confirmation)
	end

end
