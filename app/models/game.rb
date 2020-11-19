class Game < ApplicationRecord
has_many :libraries
has_many :added_games, through: :libraries, source: :user
end
