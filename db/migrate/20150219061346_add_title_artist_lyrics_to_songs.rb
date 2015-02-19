class AddTitleArtistLyricsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :artist, :string
    add_column :songs, :lyrics, :string
  end
end
