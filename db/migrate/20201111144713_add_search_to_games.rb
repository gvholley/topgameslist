class AddSearchToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :search, :string
  end
end
