class TagsController < ApplicationController

	#tags will be links to show all posts
	#created that also have that specific tag
	#we may need the index to do this.
	#Added here incase we need it. Can remove. No route made for this yet.
	def index

	end

	#ability to edit any of the tags created.
	#Thinking about this further and not sure if editing tags is entirely needed.
	#can discuss and possibly remove.
	def edit
		@tag = Tag.find(params[:id])
	end

	#ability to delete any tag a user may have created.
	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to gifs_path
	end





end
