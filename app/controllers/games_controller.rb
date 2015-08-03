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

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def game_params

  end
end
