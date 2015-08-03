class UsersController < ApplicationController
  include SessionHelpers
  before_action :check_authentication
  skip_before_action :check_authentication, except: [:dashboard]

  def new
    @user = User.new
    render new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user
      redirect_to dashboard_path
    else
      # display validation error message
      render new_user_path
    end
  end

  def dashboard
    # displays all relevant game idea data
    @user = current_user
    @leading_games = Game.select("games.*, COUNT(votes.id) vote_count").joins(:votes).group("games.id").order("vote_count DESC").limit(5)
    @user_games = @user.games
    @games_in_vote_que = []
    Game.all.each do |game|
      @games_in_vote_que << game if Vote.where(game_id: game.id, user_id: current_user_id).count == 0
    end
    # @games_in_vote_que = Game.select("games.*").joins(:votes).group("games.id").where.not(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
