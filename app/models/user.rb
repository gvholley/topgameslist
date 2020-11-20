class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :game
end
