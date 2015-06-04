class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end


  def create
    @post = Post.new params.require(:post).permit(:title, :link, :votes)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    redirect_to @post.link
  end


  def update
    @post = Post.find params[:id]
      if @post.update params.require(:post).permit(:title, :link, :votes)
        redirect_to root_path
      else
        render :edit
      end
  end

  def delete
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path
  end


end
