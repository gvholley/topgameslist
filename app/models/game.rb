class Game < ApplicationRecord
has_many :libraries
has_many :added_games, through: :libraries, source: :user
serialize :data

  def fetch_data
    self.data = GiantBomb::Game.detail(id)
  end

  def to_giant_bomb_game
    GiantBomb::Game.new(data)
  end

end
