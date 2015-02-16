class RemoveSongIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :song_id, :integer
  end
end
