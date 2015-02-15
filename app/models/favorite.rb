class Favorite < ActiveRecord::Base
	belongs_to :users
	belongs_to :songs
end
