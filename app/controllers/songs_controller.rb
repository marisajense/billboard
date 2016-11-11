class SongsController < ApplicationController
  before_action :set_billboard

  def index
    @songs = @billboard.songs
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = @billboard.songs.find(params[:id])
    if @song.update(song_params)
      redirect_to billboard_songs_path
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = @billboard.songs.new(song_params)
    if @song.save
      redirect_to billboard_songs_path(@billboard)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def song_params
    @billboard = Billboard.find(params[:billboard_id])
    params.require(:song).permit(:title, :genre, :rank, :billboard_id, :artist_id)
  end

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end
end
