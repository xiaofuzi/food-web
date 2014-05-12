class StaticPagesController < ApplicationController
  def home
  	@videos = Video.limit(4)
  	@foods  = Food.limit(10).all
    
    
  	@food_guizhou = Food.limit(4).where(area:"guizhou")
  	@food_sichuan = Food.limit(4).where(area:"sichuan")
  	@food_guangzhou = Food.limit(4).where(area:"guangzhou")
  	@food_shanxi = Food.limit(4).where(area:"shanxi")
  	@food_aihui = Food.limit(4).where(area:"aihui")
  	@food_xianggang = Food.limit(4).where(area:"xianggang")
  	@food_beijing = Food.limit(4).where(area:"beijing")
  	
  	@all_area_foods = [@food_guizhou,@food_beijing,@food_xianggang,@food_aihui,@food_shanxi,@food_guangzhou,@food_sichuan]
  end

  def help
  end

  def about
  end

  
end
