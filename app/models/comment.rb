class Comment < ActiveRecord::Base
	belongs_to :video
	belongs_to :user
	validates :user_id, presence: true
	validates :video_id, presence: true
end
