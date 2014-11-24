class TagsController < ApplicationController
	
	def index
		@tags = Tag.all 
	end

	#tags will be links to show all posts
	#created that also have that specific tag
	#we may need the index to do this.
	#Added here incase we need it. Can remove. No route made for this yet.
	def show
		@gifs = Gif.all 
		@tag = Tag.find(params[:id])
		erb :'/tags/show'
	end

	# NEW
	def new
	  @tag = Tag.new 
	end

	# CREATE
	def create
	  @new_tag = Tag.new(params[:tag])
	  if @new_tag.save
	  	session[:current_user_id] = @user.id
	    redirect_to tag_path(session[:current_user_id])
	  else
	    redirect :new
	  end
	end

	#ability to edit any of the tags created.
	#Thinking about this further and not sure if editing tags is entirely needed.
	#can discuss and possibly remove.
	def edit
		@tag = Tag.find(params[:id])
		if @tag != current_user
			redirect_to tag_path(session[:current_user_id])
		end
	end

# ADD POST TO TAG
def add_tag
  tag = Tag.find(params[:id])
  gif = Gif.find(params[:gif_id])
  tag.gifs << gif
  redirect_to tag_path(tag)
end

# def remove_song
# 		playlist = Playlist.find(params[:id])
# 		song = Song.find(params[:song_id])
# 		playlist.remove_song(song)
# 		redirect_to playlist_path(playlist)
# 	end

# # REMOVE POST FROM TAG
# put('/tags/:id/remove_post') do
#   tag = Tag.find(params[:id])
#   post = Post.find(params[:post_id])
#   tag.posts.destroy(post)
#   redirect("/tags/#{tag.id}")
# end

private

	#params for the new tag form.
	def tag_params
		params.require(:tag).permit(:name)
	end



end
