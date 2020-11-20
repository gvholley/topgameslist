class LibraryController < ApplicationController
  #before_action :authenticate_user!

  def index
    @library_games = User.library_additions
  end
end
