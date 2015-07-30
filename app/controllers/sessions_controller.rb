class SessionsController < ApplicationController
  def index

  end

  def login
    #logs the user in, and redirects to the user dashboard
  end

  def logout
    #logs the user out and returns to index
    render plain: "this is the logout route"
  end

  private

  def session_params

  end
end
