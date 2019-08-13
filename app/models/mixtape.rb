class Mixtape < ApplicationRecord
    has_many :mixtape_songs
    has_many :songs, through: :mixtape_songs
end
