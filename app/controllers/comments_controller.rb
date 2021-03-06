class CommentsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment.user = current_user
    @comment.save! # 與 @comment.save 作比較
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.find(params[:id]) # @comment = @restaurant.comments.find(params[:id])

    if current_user.admin? || current_user == @comment.user
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
