class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @foods= @user.foods
    @videos = @user.videos 
  end
end