class SessionController < ApplicationController

  def new
  end

  def create
    name = params[:name]
    password = params[:password]

    user = User.find_by name: name
    if (user) && (user.authenticate password)
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = "Try again. Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
