class Video < ActiveRecord::Base
	default_scope -> { order('created_at DESC')}
	validates :title, presence:true

	def get_video_params
		#require "getvideo"
        new_video = Getvideo.parse self.videourl
        self.title = new_video.title
        self.flash = new_video.flash
        self.cover = new_video.cover
        self.save
    end
end
