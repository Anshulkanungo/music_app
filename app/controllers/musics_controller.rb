class MusicsController < ApplicationController
  before_action :set_music, only: %i[ show edit update destroy ]

  
  def index
    if current_user.role == "organizer"
      @musics = Music.where(user_id: current_user.id) rescue nil
    else
      @musics = Music.all
    end
  end

  def show
    @rate = Rate.find_by(rater_id: current_user,rateable_type: "Music", rateable_id: @music.id)
    @rate = @rate.stars if @rate.present?
      # respond_to do |format|
      # format.js 
      # end
  end

  def new
    @music = Music.new
  end

  def edit
  end

  def create
    @music = Music.new(music_params)
    #respond_to do |format|
      if @music.save
         redirect_to @music
      else
         render :new
      end
    #end
  end

  def update
    #respond_to do |format|
      if @music.update(music_params)
         redirect_to @music
      else
         render :edit
      end
    #end
  end

  def abc
    @music = Music.find_by(id: params[:music_id])
    debugger
    rate = @music.rates.find_by(rater_id: current_user.id)
    if rate.present?
      rate.update(stars: params[:star])
    else
      @music.rates.create(rater_id: current_user.id,stars: params[:star])
    end

  end


  def destroy
    @music.destroy
     redirect_to musics_url
  end

  private
    def set_music
      @music = Music.find(params[:id])
    end

    def music_params
      params.require(:music).permit(:genre,:user_id, songs:[])
    end
end