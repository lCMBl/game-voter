class GamesController < ApplicationController
  def index
    render plain: "Games index"
  end

  def show
    render plain: "This is a game"
  end

  def new
    render plain: "you are creating a new game"
  end

  def create

  end

  def edit
    render plain: "you are editing a game"
  end

  def update

  end

  def destroy

  end

  private

  def game_params

  end
end
