class VideosController < ApplicationController
	def new
		@video = Video.new
	end

	def index
		@videos = Video.all
	end
    
    def show
    	@videos = Video.all
    	@video = Video.find(params[:id])
    	@title = @video.title
    end

	def create
        @video = Video.new(params[:user])    # Not the final implementation!
    if  @video.save
        # Handle a successful save.
    else
        render 'new'
    end
  

end
end
