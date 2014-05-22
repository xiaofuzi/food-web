#coding: utf-8
class FoodsController < ApplicationController
	def index
  
    @area_tags =  Food.area_counts
    @food_tags =  Food.tag_counts
    @area_route = params[:area]
    if params[:area]
      areafood = Food.tagged_with(params[:area])
		  @foods = areafood.paginate(page: params[:page],per_page: 16)
    else
      @foods = Food.paginate(page: params[:page],per_page: 16)
    end
    end

	def new
		@food = Food.new
	end

	def show
		@food = Food.find(params[:id])
		@foods= Food.limit(8).where(area:@food.area)
	end

	def create
		@food = Food.new(food_params)
		  if user_signed_in? 
		     @food.user_id = current_user.id
		  end
      @food.area_list.add(@food.area)
      tag_arry = @food.tag.split(",")
      @food.tag_list.add(tag_arry ) 
      
		if @food.save
			redirect_to root_path
		else
			render new
		end
	end
    
    def edit
        @food = Food.find(params[:id])
    end
    def update
    	@food = Food.find(params[:id])
    	
    	if @food.update_attributes(food_params)
           # Handle a successful update.
           flash[:success] = "food menu updated"
           redirect_to @food
        else
           render 'edit'
        end
    end

    def destroy
    	Food.find(params[:id]).destroy
        flash[:success] = "Food destroyed."
        redirect_to foods_url
    end

    def tag_cloud
    @tags = Food.tag_counts_on(:tags)
  end
private
    def food_params
      params.require(:food).permit(:name,:area,:cover,:description,:cook,:tag)
    end
end
