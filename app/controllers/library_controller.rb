class LibraryController < ApplicationController
  #before_action :authenticate_user!
  #find user id through params
  def index
    @library_games = User.find(params[:id]).library_additions
  end
end
