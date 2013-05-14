class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      session[:user_id] = user.id
      redirect_to user_show_path
    else
      redirect_to login_url, :alert => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end
end
