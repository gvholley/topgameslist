class GamesController < ApplicationController

  def index
  @games = GiantBomb::Search.new().query(params[:query]).resources('game').limit(100).fields('name').fetch
  end


private

  def game_params
    params.require(:game).permit(:name, :search, :query)
  end
end
