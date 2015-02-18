class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :songs, through: :favorites
  validates :username, :password, :email, presence: true

  def favorite_songs
    songs = []
    favorites = Favorite.where(user_id: self.id)
    if ! favorites.nil?
      favorites.each do |f|
        songs.push(song.find(favorite_id))
      end
    end

  end
  

 # BCrypt::Engine.cost = 12

 #  attr_reader :password

 #  validates_confirmation_of :password
 #  validates_presence_of :password_digest

 #  def authenticate(unencrypted_password)
 #    if BCrypt::Password.new(password_digest) == unencrypted_password
 #      self
 #    else
 #      false
 #    end
 #  end

 #  def password=(unencrypted_password)
 #    if unencrypted_password.nil?
 #      self.password_digest = nil
 #    else 
 #      @password = unencrypted_password
 #      self.password_digest = BCrypt::Password.create(@password)
 #    end
 #  end

 #  def self.confirm(username_param, password_param)
 #  	user = User.find_by({username: username_param})
 #  	user.authenticate(password_param)
 #  end

end