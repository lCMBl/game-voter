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
      @game = Game.find_by_id(params[:id])
      redirect_to games_path unless current_user_id == @game.user_id
  end

  def update
    @game = Game.find_by_id(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      redirect_to edit_game_path(@game)
    end
  end

  def destroy
    @game = Game.find_by_id(params[:id])
    @game.destroy
    redirect_to dashboard_path
  end

  private

  def game_params
    params.require(:game).permit(:title, :description)
  end
end
