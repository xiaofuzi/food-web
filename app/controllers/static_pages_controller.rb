class StaticPagesController < ApplicationController
  def home
  	@videos = Video.limit(9)
  end

  def help
  end

  def about
  end

  
end
