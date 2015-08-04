module GameHelpers
  def has_voted_on_game?(game, current_user_id)
    Vote.where(game_id: game.id, user_id: current_user_id).count != 0
  end
end
