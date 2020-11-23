class Game < ApplicationRecord
has_many :libraries
has_many :added_games, through: :libraries, source: :user
serialize :data

  def fetch_data
    game = GiantBomb::Game.detail(id)
    self.data = Hash[game.instance_variables.map { |var| [var.to_s[1..-1], game.instance_variable_get(var)] } ]
  end

  def to_giant_bomb_game
    GiantBomb::Game.new(data)
  end

end
