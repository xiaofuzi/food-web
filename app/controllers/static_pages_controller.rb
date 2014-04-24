class StaticPagesController < ApplicationController
  def home
  	@videos = Video.limit(8)
  end

  def help
  end

  def about
  end
end
