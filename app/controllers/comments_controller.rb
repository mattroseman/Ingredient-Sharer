class CommentsController < ApplicationController
  before_action :set_post

  def create
    set_post
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You successfully commented on the post."
      redirect_to :back
    else
      flash[:alert] = "Please check the comment form."
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = @post.comments.find params[:id]
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
