class MixtapesController < ApplicationController
    before_action :set_mixtape, only: [:show, :edit, :update, :destroy]

    def index
        @mixtapes = Mixtape.all()
    end

    def show
        if add_preset_durations > 0
            @mixtape.update(duration: add_preset_durations)
        end
        @free_space = Time.at(1080 - @mixtape.duration).utc.strftime("%M:%S")
        @mixtape_song = MixtapeSong.new()
    end

    def new
        @mixtape = Mixtape.new()
    end

    def create
        @mixtape = Mixtape.create(mixtape_params)

        redirect_to @mixtape
    end

    def edit
        @mixsongs = @mixtape.mixtape_songs
    end

    def update
        @mixtape.update(mixtape_params)

        redirect_to @mixtape
    end

    def destroy
        @mixtape.destroy()

        redirect_to mixtapes_path
    end
    
    private

    def set_mixtape
        @mixtape = Mixtape.find(params[:id])
    end

    def mixtape_params
        params.require(:mixtape).permit(:label)
    end

    def add_preset_durations
        # byebug
        if @mixtape.songs.length != 0
            @mixtape.songs.map(&:duration).reduce(:+)
        else
            return 0
        end
    end
end
