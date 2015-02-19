class Song < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites

end

