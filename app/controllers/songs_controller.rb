class SongsController < ApplicationController

  def new
    @song = Song.new
  end
  def create
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end
  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:name, :artist_id, :genre_id))
  end
  def show
    @song = Song.find(params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end
  def index
    @songs = Song.all
  end
  def edit
    @song = Song.find(params[:id])
  end
  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
