class FlockBirdsController < ApplicationController
  def index
    @flock = Flock.find(params[:id])
    if params[:sort_alpha] == "true"
      @birds = @flock.sort_birds_alpha
    elsif params[:age_filter] != nil
      @birds = @flock.birds_by_age(params[:age_filter])
    else
      @birds = @flock.birds
    end
  end

  def new
    @flock = Flock.find(params[:id])
  end

  def create 
    @flock = Flock.find(params[:id])
    @flock.birds.create(
      name: params[:name],
      band_id: params[:band_id],
      age: params[:age],
      is_bonded: params[:is_bonded]
    )
    
    redirect_to "/flocks/#{@flock.id}/birds"
  end
end