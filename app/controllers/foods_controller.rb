class FoodsController < ApplicationController
	def index
    #@tag = Tag.find(params[:tag_id]) if params[:tag_id]
    #@areas =[["guizhou","贵州"],["beijing","北京"],["sichuan","四川"],["fujian","福建"],["shanxi","陕西"],["guangzhou","广州"],["xianggang","香港"]]
    
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
private
    def food_params
      params.require(:food).permit(:name,:area,:cover,:description,:cook)
    end
end
