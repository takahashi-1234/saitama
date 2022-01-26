class PostsController < ApplicationController
  def index
    @post=Post.new
    @posts=Post.all
    @gourmand_posts=Post.where(kind:"グルメ")
    @fashion_posts=Post.where(kind:"ファッション")
    @travel_posts=Post.where(kind:"観光")
    @experience_posts=Post.where(kind:"体験")
  end
  def create
    post=current_user.posts.new(post_params)
    tag_list=params[:post][:tag_name].split("、")
    if post.save
      post.save_tag(tag_list)
      redirect_back(fallback_location:root_path)
    else
      redirect_back(fallback_location:root_path)
    end    
  end
  def destroy
    post=Post.find(params[:id])
    post.tags.each do |tag|
      if TagMap.where(tag_id:tag.id).count==1
        tag.destroy
      end
    end
    post.destroy
    redirect_to posts_path
  end
  
  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
  end
  private
  def post_params
    params.require(:post).permit(:title,:body,:image,:kind)
  end
end
