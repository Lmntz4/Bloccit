class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = Topic.find(@post.topic)
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment wasn't removed. Try again."
      redirect_to [@topic, @post]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
