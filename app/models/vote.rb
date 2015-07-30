class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user, :game, presence: true
  validates :user, uniqueness: {scope: :game, message: "Only one vote per user per game"}
end
