class Mixtape < ApplicationRecord
    has_many :mixtape_songs, dependent: :destroy
    has_many :songs, through: :mixtape_songs

    validates :label, presence: true, uniqueness: true

    def to_min
        total_seconds = self.duration
        Time.at(total_seconds).utc.strftime("%M:%S")
    end
        
end
