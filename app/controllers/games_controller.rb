class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
  end

  def show
  end

  def search
    @games = Game.find_by(params[:id])
    search = GiantBomb::Search.new().query(:query)
  end

  def new
    @game = Game.new
  end

  def edit
  end

private

  def game_params
    params.require(:game).permit(:name)
  end
end
