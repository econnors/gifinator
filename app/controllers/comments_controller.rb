class CommentsController < ApplicationController

	#create a new comment. Would be awesome if
	#we could have it as a form under the gifs themselves.
	#and then redirect right back to the same page and show the comment
	def new
		@comment = Comment.new
	end

	#Post route for the new route in this controller
	def create
		@comment = Comment.create(comment_params)
		redirect_to gifs_path
	end

	#** NEEDS / HAS VIEW
	def edit
		@comment = Comment.find(params[:id])
	end


	#put route for the edit route
	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to gifs_path
		else
			render :edit
		end

		#delete route for comment
		def destroy
			@comment = Comment.find(params[:id])
			@comment.destroy
			redirect_to gifs_path
		end

		private

		def comment_params
			params.require(:comment).permit(:comment, :user_id, :gif_id)
		end

	end
