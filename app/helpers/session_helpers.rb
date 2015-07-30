module SessionHelpers

  def login_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @user || User.find_by_id(session[:user_id])
  end

  def current_user_id
    user = User.find_by_id(session[:user_id])
    user.id unless user == nil
  end

  def logout_user
    session[:user_id] = nil
  end
end
