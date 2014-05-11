class VideosController < ApplicationController
	def new
		@video = Video.new
	end

	def index
		@videos = Video.paginate(page: params[:page],per_page: 16)
	end
    
    def show
    	
    	@video = Video.find(params[:id])
        #@video.get_video_params
    	@title = @video.title
        #@comments = @video.comments.paginate(page: params[:page])
        #@comment = current_user.comments.build if user_signed_in?
    end

	def create
        @video = Video.new(video_params)    # Not the final implementation!
        #require "getvideo"
        new_video = Getvideo.parse @video.videourl
        if new_video
           @video.title = new_video.title
           @video.flash = new_video.flash
           @video.cover = new_video.cover

        end
        if current_user.user_name?
            @video.user_id = current_user.id
        end
    if  @video.save
        flash[:success] = "Create a video sucessfully!"
        redirect_to root_path

        # Handle a successful save.
    else
        flash[:error] = "Failed to create a video,the website is not correct !"
          
        redirect_to new_video_path  
    end
    end

    def destroy
        Video.find(params[:id]).destroy
        flash[:success] = "Video destroyed."
        redirect_to videos_url
    end
    #On doing,there is something wrong
    def admin_page
        @videos = Video.paginate(page: params[:page],per_page: 20)
    end
  private

    def video_params
      params.require(:video).permit(:videourl)
    end

end

