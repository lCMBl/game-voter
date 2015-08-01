class UsersController < ApplicationController
  def new
    @user = User.new
    render new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to dashboard_path
    else
      # display validation error message
      render new_user_path
    end
  end

  def dashboard
    # displays all relevant game idea data
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
