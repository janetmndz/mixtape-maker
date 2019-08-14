class MixtapeSong < ApplicationRecord
  belongs_to :mixtape
  belongs_to :song

  validate :can_save, on: :create

  def can_save
    if (self.mixtape.duration + self.song.duration) > 1080
      errors.add(:mixtape, "doesn't enough free space to save song")
    end
  end
end
