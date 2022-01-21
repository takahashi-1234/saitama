class FavoritesController < ApplicationController
  before_action:find_post
  
  def create
    favorite=current_user.favorites.new(post_id:@post.id)
    favorite.save
    redirect_back(fallback_location:root_path)
  end
  
  def destroy
    favorite=current_user.favorites.find_by(post_id:@post.id)
    favorite.destroy
    redirect_back(fallback_location:root_path)
  end
  
  private
  def find_post
    @post=Post.find(params[:post_id])
  end
end
