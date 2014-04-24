class StaticPagesController < ApplicationController
  def home
  	@videos = Video.limit(4)
  end

  def help
  end

  def about
  end
end
