class GamesController < ApplicationController

  def index
  if params[:query].present?
      sql_query = "name LIKE :query"
      @games = Game.where(sql_query, query: "%#{params[:query]}%")
    else
     flash[:notice] = "No Games Found"
    end
  end


  def search
    @games = GiantBomb::Search.new().query(params[:query]).resources('game').limit(5).fetch
    render 'index'
  end


private

  def game_params
    params.require(:game).permit(:name, :search, :query)
  end
end
