class Food < ActiveRecord::Base
	
	acts_as_taggable_on :areas,:tags
	#acts_as_taggable_on :tags
	belongs_to :user
    #attr_accessible :tag_list
	acts_as_taggable
	validates :name, presence:true, uniqueness: true
	scope :by_join_date, order("created_at DESC")
	default_scope -> { order('created_at DESC')}
end
