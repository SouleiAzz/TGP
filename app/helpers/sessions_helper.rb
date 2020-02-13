module SessionsHelper
  def current_user
    session[:user_id] ? User.find(session[:user_id]) : false
  end

   def log_in(user)
    session[:user_id] = user.id
  end

end
