class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    authorize favorite

    if favorite.save
      flash[:notice] = "Post has been favorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error favoriting the post.  Try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post is no longer favorited."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Post is still favorited.  Try again."
      redirect_to [post.topic, post]
    end
  end
end
