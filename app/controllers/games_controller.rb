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
    @games = Game.find(params[:id])
    game = GiantBomb::Game.name
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
