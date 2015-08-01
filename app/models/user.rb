class User < ActiveRecord::Base
  has_secure_password

  has_many :votes
  has_many :games

  validates :email, :name, :password_digest, presence: true
  validates :email, uniqueness: true
end
