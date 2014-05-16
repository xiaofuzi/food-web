class Video < ActiveRecord::Base
	
    belongs_to :user
	default_scope -> { order('created_at DESC')}
	validates :title, presence:true, uniqueness: true

end
