class PostsController < ApplicationController
def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "作成しました"
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "作成しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, images: [])
  end
end
