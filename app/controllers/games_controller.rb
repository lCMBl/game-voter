class GamesController < ApplicationController
  def index
    @games = Game.all
    @user_count = User.all.count
  end

  def show

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
