class AddFavoriteIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :favorite_id, :integer
  end
end
