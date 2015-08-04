class VotesController < ApplicationController
  include SessionHelpers

  def create
    # creates a vote, then redirects back to the page, using flash to deliver a notification
    #TODO jQuery only allows one vote before reload?
    @game = Game.find_by_id(params[:game_id])
    vote = @game.votes.new(user_id: current_user_id)
    if vote.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

end
