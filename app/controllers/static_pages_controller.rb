class StaticPagesController < ApplicationController
  def home
  	@videos = Video.limit(4)

  	@food_guizhou = Food.limit(4).where(area:"guizhou")
  	@food_sichuan = Food.limit(4).where(area:"sichuan")
  end

  def help
  end

  def about
  end

  
end
