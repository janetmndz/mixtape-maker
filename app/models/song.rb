class Song < ApplicationRecord
    has_many :mixtape_songs, dependent: :destroy
    has_many :mixtapes, through: :mixtape_songs

    def to_min
        total_seconds = self.duration
        Time.at(total_seconds).utc.strftime("%M:%S")
    end
end
