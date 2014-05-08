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

private
    def food_params
      params.require(:food).permit(:name,:area,:cover,:description,:cook)
    end
end
