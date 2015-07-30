class SessionsController < ApplicationController
  include SessionHelpers

  def index
    @user = User.new
  end

  def login
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      login_user(user)
      render plain: "User logged in: #{user.name}: #{current_user_id}"
    else
      render root_path
    end
  end

  def logout
    #logs the user out and returns to index
    render plain: "this is the logout route"
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
