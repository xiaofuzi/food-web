class CommentsController < AppliCationController
    before_action :user_signed_in, only: [:create, :destroy]

  def create
  	 @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def index
  end

  private

    def comment_params
      params.require(:comment).permit(:content,:video_id,:user_id)
    end
end