module GamesHelper
  def user_added_to_library? user, game
    user.libraries.where(user: user, game: @game).any?
  end
end
