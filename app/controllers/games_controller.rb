class GamesController < ApplicationController
  include SessionHelpers
  before_action :check_authentication
  skip_before_action :check_authentication, only: [:index, :show]

  def index
    @games = Game.all
    @user_count = User.all.count
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      #set errors and render
      render new_game_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def game_params
    params.require(:game).permit(:title, :description)
  end
end
