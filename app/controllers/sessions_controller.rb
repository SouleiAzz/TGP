class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:return_to].nil?
        redirect_to root_path
      else
        redirect_to(session[:return_to])
      end
    else 
      @error = "sign in"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_back(fallback_location: root_path)
  end
end
