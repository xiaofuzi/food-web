#coding: utf-8
class StaticPagesController < ApplicationController
  def home
    
  	@videos = Video.limit(4)
  	@foods  = Food.limit(15).all
    
    
  	@food_guizhou = Food.limit(4).where(area:"贵州")
        @food_sichuan = Food.limit(4).where(area:"四川")
        @food_guangzhou = Food.limit(4).where(area:"广州")
        @food_shanxi = Food.limit(4).where(area:"陕西")
        @food_fujian = Food.limit(4).where(area:"福建")
        @food_xianggang = Food.limit(4).where(area:"香港")
        @food_beijing = Food.limit(4).where(area:"北京")
        
  	@all_area_foods = [@food_guizhou,@food_beijing,@food_xianggang,@food_fujian,@food_shanxi,@food_guangzhou,@food_sichuan]
  end

  def help
   
  end

  def about
 
  end
  
  def index
  end
  
end
