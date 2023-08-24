class FlockBirdsController < ApplicationController
  def index
    @flock = Flock.find([params[:id]]).first
    @birds = @flock.birds
  end

  def new
    @flock = Flock.find([params[:id]]).first
  end

  def create 
    @flock = Flock.find([params[:id]]).first
    @flock.birds.create(
      name: params[:name],
      band_id: params[:band_id],
      age: params[:age],
      is_bonded: params[:is_bonded]
    )
    
    redirect_to "/flocks/#{@flock.id}/birds"
  end
end