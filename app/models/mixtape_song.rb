class MixtapeSong < ApplicationRecord
  belongs_to :mixtape
  belongs_to :song
end
