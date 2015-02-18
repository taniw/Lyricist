class Song < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :users, through: :favorites

	validates :title, presence: true
	validates :artist, presence: true
	validates :lyrics, presence: true

end

