class PostsController < ApplicationController
  def index
    @posts = Post.all.order("votes desc")
    render :index
  end
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new params.require(:post).permit(:title, :link, :user_id)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @post = Post.find params[:id]
  end

  def downvote
  @post = Post.find params[:id]
  @post.votes -= 1
  @post.save
  redirect_to root_path
  end

  def upvote
  @post = Post.find params[:id]
  @post.votes += 1
  @post.save
  redirect_to root_path
  end


  def update
    @post = Post.find params[:id]
      if @post.update params.require(:post).permit(:title, :link, :votes, :vote_down, :user_id)
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
