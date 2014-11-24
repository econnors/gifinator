class TagsController < ApplicationController
	
	#tags will be links to show all posts
	#created that also have that specific tag
	#we may need the index to do this.
	#Added here incase we need it. Can remove. No route made for this yet.
	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to user_path(session[:current_user_id])
	end
end
