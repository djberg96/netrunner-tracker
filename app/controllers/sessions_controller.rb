class SessionsController < ApplicationController
  skip_before_filter :authorize

  # TODO: Bug in routes? Shouldn't have to do this.
  def new
    if request.post?
      create
    end
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end
end
