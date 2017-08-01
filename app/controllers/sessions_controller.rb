class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to home_index
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_index, notice: "Logged out"
  end
end
