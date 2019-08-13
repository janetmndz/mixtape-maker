class MixtapeSongsController < ApplicationController
    def new
        @mixtape_song = MixtapeSong.new()
    end

    def create
        @mixtape_song = MixtapeSong.create(mixtape_song_params)

        redirect_to @mixtape_song.mixtape
    end

    private

    def mixtape_song_params
        params.require(:mixtape_song).permit(:song_id, :mixtape_id)
    end
end
