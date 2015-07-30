class UsersController < ApplicationController
  def new
    render plain: "hi!"
  end

  def create

  end

  def dashboard
    # displays all relevant game idea data
  end

  private

  def user_params

  end
end
