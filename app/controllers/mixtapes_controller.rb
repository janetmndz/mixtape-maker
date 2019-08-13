class MixtapesController < ApplicationController
    before_action :set_mixtape, only: [:show, :edit, :update]

    def index
        @mixtapes = Mixtape.all()
    end

    def show 
    end

    def new
        @mixtape = Mixtape.new()
    end

    def create
        @mixtape = Mixtape.create(mixtape_params)

        redirect_to @mixtape
    end

    def edit
        
    end

    def update
        @mixtape.update(mixtape_params)

        redirect_to @mixtape
    end

    def destroy
        set_mixtape
        @mixtape.mixtape_songs.destroy_all()
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
end
