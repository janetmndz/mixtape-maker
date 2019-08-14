class MixtapeSongsController < ApplicationController
    # validate :can_save, on: :create
    def new
        @mixtape_song = MixtapeSong.new()
    end

    def create
        @mixtape_song = MixtapeSong.create(mixtape_song_params)

        if @mixtape_song.invalid?
            flash[:errors] = @mixtape_song.errors.full_messages
        end
        redirect_to @mixtape_song.mixtape
        # total_time = @mixtape_song.mixtape.duration + @mixtape_song.song.duration
        # @mixtape_song.mixtape.update(duration: total_time)

        # redirect_to @mixtape_song.mixtape
    end

    def destroy
        @mixtape_song = MixtapeSong.find(params[:id])
        @mixtape = @mixtape_song.mixtape
        @mixtape_song.destroy()

        redirect_to @mixtape

        
    end

    private

    def mixtape_song_params
        params.require(:mixtape_song).permit(:song_id, :mixtape_id)
    end
end
