class GamesController < ApplicationController

  def index
  @games = GiantBomb::Search.new().query(params[:query]).resources('game').limit(100).fetch
  end

  def show
  @game = GiantBomb::Game.detail(params[:id])
  end


  def library
    type = params[:type]

    if type == "add"
      current_user.library_additions << @game
      redirect_to library_index_path, notice: "Game was added to your library"

    elsif type == "remove"
      current_user.library_additions.delete(@game)
      redirect_to root_path, notice: "Game was removed from your library"
    else
      # Type missing, nothing happens
      redirect_to game_path(@game), notice: "Looks like nothing happened. Try once more!"
    end
  end


private

  def game_params
    params.require(:game).permit(:name, :search, :query)
  end
end
