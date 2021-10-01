class Music < ApplicationRecord

	enum genre: {old_song:"old_song",new_song: "new_song",Bollywood: "Bollywood",Hollywood: "Hollywood"}

    has_many_attached :songs
   
    has_many :playlists

    belongs_to :user

    validates :songs, presence: true
    ratyrate_rateable "genre"

     
end
