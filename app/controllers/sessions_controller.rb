class SessionsController < ApplicationController
  def index
    render plain: "Hi!"
  end

  def login
    #logs the user in, and redirects to the user dashboard
  end

  private

  def session_params

  end
end
