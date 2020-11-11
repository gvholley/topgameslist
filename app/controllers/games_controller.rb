class GamesController < ApplicationController

  def index
  @games = Game.all.order('created_at DESC')
  @games = @games.search(params[:query]) if params[:query].present?
  end

  def show
    @game = GiantBomb::Game.name
  end

  def search
    @games = GiantBomb::Search.new().query(params[:query]).resources('game').limit(5).fetch
    redirect_to index_path
  end


private

  def game_params
    params.require(:game).permit(:name)
  end
end
