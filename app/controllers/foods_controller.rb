class FoodsController < ApplicationController
	def index
		@foods = Food.paginate(page: params[:page],per_page: 16)
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
        redirect_to videos_url
    end
private
    def food_params
      params.require(:food).permit(:name,:area,:cover,:description,:cook)
    end
end
