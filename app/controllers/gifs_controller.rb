class GifsController < ApplicationController


	before_action :authenticate
	#will be the community board where all the gifs are displayed
	#will have links to individaul users and links to tag displays
	#**NEEDS / HAS VIEW
	def index
		@gif = Gif.get_gif
	end

	#Will have comments option on this page#**NEEDS / HAS VIEW
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
		ziggeo = Ziggeo.new("90ed6ab82e70ec226efe2a5778945a62", "c2f718974008f07d567255e53b80a754", "292d3ac71c64213d968d24af93b23bdc")
		data = ziggeo.videos.download_video(params[:videotoken])
		#you should be able to put the data variable directly to s3 
	end


	def create_gif
		s3 = User.new_aws_request
		bucket = s3.buckets[ENV['BUCKET']]
		bucket.acl = :public_read
	end



	#delete any specific gif. The gif may only be deleted by its user.
	#I would like this to redirect to the page of the currently logged in user
	#need to work out the redirect path
	def destroy
		@gif = Gif.find(params[:id])
		if session[:current_user_id] != @gif.user_id
			redirect_to user_path(session[:current_user_id])
		else @gif.destroy
			redirect_to user_path(session[:current_user_id])
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
