class VideosController < ApplicationController
	def new
		@video = Video.new
	end

	def index
		@videos = Video.all
	end
    
    def show
    	
    	@video = Video.find(params[:id])
        #@video.get_video_params
    	@title = @video.title
    end

	def create
        @video = Video.new(video_params)    # Not the final implementation!
        #require "getvideo"
        new_video = Getvideo.parse @video.videourl
        @video.title = new_video.title
        @video.flash = new_video.flash
        @video.cover = new_video.cover
    if  @video.save
        flash[:success] = "Create a video sucessfully!"
        redirect_to root_path

        # Handle a successful save.
    else
        render 'new'
        
    end
    end
  private

    def video_params
      params.require(:video).permit(:title,:videourl)
    end

end

