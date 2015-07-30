class User < ActiveRecord::Base
  has_many :votes
  has_many :games
end
