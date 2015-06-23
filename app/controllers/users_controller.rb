class UsersController < ApplicationController

  before_action do
    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id
    @posts = Post.all.order("votes desc" )
      # if @current_user.nil?
      #   redirect_to login_path
      # end
    end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:name, :password, :email, :password_confirmation, :id)
    if @user.save
      flash[:success] = "Welcome to Reddit"
      redirect_to @user
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    @users = User.all
    @posts = Post.all.order("votes desc")
  end



end
