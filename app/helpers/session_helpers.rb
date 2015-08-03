module SessionHelpers

  def login_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @user || User.find_by_id(session[:user_id])
  end

  def current_user_id
    session[:user_id]
  end

  def logout_user
    session[:user_id] = nil
  end

  def is_logged_in?
    session[:user_id] != nil
  end

  def check_authentication(redirect_route = root_path)
    # sends the user to the redirect route if not logged in.
    redirect_to redirect_route unless is_logged_in?
  end
end
