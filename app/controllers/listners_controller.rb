class ListnersController < ApplicationController
	# def listner
 #    redirect_to listner_path
 #   end
 def index
 	@musics = Music.all	
 end

 def show
    @playlist = Playlist.params(id)
 end

 def new
   @music_id = Music.find(params[:id])
    @playlist = Playlist.new
 end

 def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
        redirect_to show
    else
        render 'new'
    end
 end
 
 def fav

 end
 private
 def playlist_params
      params.require(:playlist).permit(:user_id, :music_id)
    end
end
