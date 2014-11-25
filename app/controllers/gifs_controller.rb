class GifsController < ApplicationController


	#====================
	#  RESTFUL ROUTES
  #====================

	before_action :authenticate

	#Displays all gifs in order from newest to oldest. 
	#All of the times a gif is displayed it has a link to the user that made it and the tags
	
	def index
		@gif = Gif.order(created_at: :desc)
	end


 ##=========================
 ## DELETE COMMENT FROM GIF
 ##=========================

 #Has the option to add an additional tag. As well as add comments. 
 
	def show
		@gif = Gif.find(params[:id])
	end

	##=========================
  ##     NEW GIF PAGE
  ##=========================

  #View has embedded ziggeo recorder. As well as two forms for tags.

	def new
		@gif = Gif.new
	end

	##=========================
  ##     CREATE A GIF
  ##=========================

	#The meat and potatos of this app. Runs an HTTP get request to CloudConverter API
	#with the just recorded video being passed into the params. 
	#Then runs another HTTP get request to get the json of the list of files you have converted. 
	#grabs the newest video, and then the value of the url videos are stored at. 
	#API work around to sub the parsed URL into the URL needed to display video
	#Creates a new gif and tags for the gif at the same time.  
	#Uses ENV variable to hide all API keys


	def create
		cloudconverturl = "https://api.cloudconvert.com/convert?apikey=#{ ENV['CLOUD_CONVERT_KEY'] }&input=download&download=inline&inputformat=mp4&outputformat=gif&file=https%3A%2F%2Fembed.ziggeo.com%2Fv1%2Fapplications%2F#{ ENV['ZIGGEO_APPLICATION_TOKEN'] }%2Fvideos%2F#{params[:videotoken]}%2Fvideo.mp4&converteroptions[video_resolution]=480x320&converteroptions[video_fps]=5"
		conv = HTTParty.get(cloudconverturl)
		sleep(1)
		value = HTTParty.get("https://api.cloudconvert.com/processes?apikey=#{ ENV['CLOUD_CONVERT_KEY'] }")[-1].values[5]
		url = value.gsub("process", "download")
		gif_url = ("https:#{url}?inline")

		@gif = Gif.create({
												image_url: gif_url,
												user_id: session[:current_user_id]
		})

		tag_one = Tag.find_or_create_by({
													 name: "#{params[:tag_one]}"
		})

		tag_two = Tag.find_or_create_by({
													 name: "#{params[:tag_two]}"
		})

		@gif.tags.push(tag_one, tag_two)

		redirect_to user_path(session[:current_user_id])
	end

	##===============
  ## DELETE GIF
  ##===============

	#Allows a user to delete a gif. The gif may only be deleted by its user.
	#After deleting you are redirected to your own account page

	def destroy
		@gif = Gif.find(params[:id])
		if @gif.user_id != session[:current_user_id]
			redirect_to user_path(session[:current_user_id])
		else @gif.destroy
			redirect_to user_path(session[:current_user_id])
		end
	end

	#====================
	# NON RESTFUL ROUTES
  #====================

  #====================
	#   ADD TAG TO GIF
  #====================

  #Allows any user to add another tag to the gif post creation. 

	def add_tag
		@tag = Tag.find_or_create_by({
			name: "#{params[:tag]}"
			})
		@gif = Gif.find(params[:id])
		@gif.tags.push(@tag)
		redirect_to gif_path(@gif)
	end

  #=========================
  # DELETE COMMENT FROM GIF
  #=========================

  #Allows a user to delete only their comments from the gif. 

	def remove_comment
		@comment = Comment.find(params[:id])
		if @comment.user_id != session[:current_user_id]
			redirect_to user_path(session[:current_user_id])
		else
			@comment.destroy
			redirect_to gif_path(@comment.gif_id)
		end
	end

	#=====================
	# ADD COMMENT TO GIF
  #=====================

  #Allows user to add a comment to a gif. 

  def add_comment
  	@gif = Gif.find(params[:id])
  	@comment = Comment.create({
  		comment: "#{params[:comment]}",
  		user_id: session[:current_user_id],
  		gif_id: @gif.id
  		})
  	redirect_to gif_path(@gif)
  end

end
