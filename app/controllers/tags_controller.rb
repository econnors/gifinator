class TagsController < ApplicationController
	
	#tags will be links to show all posts
	#created that also have that specific tag
	#we may need the index to do this.
	#Added here incase we need it. Can remove. No route made for this yet.
	def show
		@gifs = Gif.all 
		@tag = Tag.find(params[:id])
		erb :'/tags/show'
	end

	#ability to edit any of the tags created.
	#Thinking about this further and not sure if editing tags is entirely needed.
	#can discuss and possibly remove.
	# def edit
	# 	@tag = Tag.find(params[:id])
	# 	if @tag != current_user
	# 		redirect_to tag_path(session[:current_user_id])
	# 	end
	# end

private

	#params for the new tag form.
	def tag_params
		params.require(:tag).permit(:name)
	end

end
