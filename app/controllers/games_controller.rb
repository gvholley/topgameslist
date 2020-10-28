class GamesController < ApplicationController

  def index
    @games = Game.limit(10)
  end

  def show
    @game = Game.find(params[:id])
  end
end