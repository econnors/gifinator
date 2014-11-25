class SessionsController < ApplicationController

	#=====================
	#  START NEW SESSION
	#=====================

	def create
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:current_user_id] = user.id
			redirect_to user_path(session[:current_user_id])
		else
			redirect_to new_user_path
		end
	end

	#===================
	#  END A SESSION
	#===================

	def destroy
		session[:current_user_id] = nil
		redirect_to new_user_path
	end
end
