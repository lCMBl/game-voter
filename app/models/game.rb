class Game < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :user, :description, :title, presence: true
end
