class SessionsController < ApplicationController
  include SessionHelpers

  def index
    @user = User.new
  end

  def login
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      login_user(user)
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def logout
    #logs the user out and returns to index
    logout_user
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
