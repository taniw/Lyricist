class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :song_id

      t.timestamps null: false
    end
  end
end