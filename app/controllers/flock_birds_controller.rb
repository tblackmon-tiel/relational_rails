class FlockBirdsController < ApplicationController
  def index
    flock = Flock.find([params[:id]])
    @birds = flock.first.birds
  end
end