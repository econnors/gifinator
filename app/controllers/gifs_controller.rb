class GifsController < ApplicationController


	before_action :authenticate
	#will be the community board where all the gifs are displayed
	#will have links to individaul users and links to tag displays
	#**NEEDS / HAS VIEW
	def index
		@gifs = Gif.all
	end

	#again another route where thinking about it Im not sure if we need this.
	#The community board and the indiidual profile pages should be enough
	#Can discuss and remove if need be#**NEEDS / HAS VIEW
	def show
		@gif = Gif.find(params[:id])
	end

	#create a new gif, will also have the tag create in this route.
	##**NEEDS / HAS VIEW
	def new
		@gif = Gif.new
		@tag = Tag.new
	end

	#Post route for the new controller.
	#Will also create a tag and push the tag to the join table

	def create
		@gif = Gif.create(gif_params)
		@tag = Tag.create(tag_params)
		@gif.tags.push(@tag)
		redirect_to gifs_path
	end

	#delete any specific gif. The gif may only be deleted by its user.
	#I would like this to redirect to the page of the currently logged in user
	#need to work out the redirect path
	def destroy
		@gif = Gif.find(params[:id])
		if @gif.user != current_user
			redirect_to user_path(session[:current_user_id])
		else @gif.destroy
			redirect_to
		end
	end


	#removing individual tag from gif

	def remove_tag
	end



	private

	def gif_params
		params.require(:gif).permit(:title, :user_id)
	end

	def tag_params
		params.require(:gif).permit(:name)
	end

end
