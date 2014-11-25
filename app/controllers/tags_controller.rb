class TagsController < ApplicationController
	
	#tags will be links to show all posts
	#created that also have that specific tag
	#we may need the index to do this.
	#Added here incase we need it. Can remove. No route made for this yet.
	
	#=====================
	#  TAG SHOW PAGE
	#=====================

	#All tags are linked to a gif via a join table. When a tag link is cliked it directs to here
	#and shows all the gifs with that tag
	def show
		@tag = Tag.find(params[:id])
	end

	#=====================
	#  DELETE A TAG
	#=====================

	#only the owner of the gif may remove tags
	
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to user_path(session[:current_user_id])
	end
end
