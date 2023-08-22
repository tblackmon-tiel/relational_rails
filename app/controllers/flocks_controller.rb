class FlocksController < ApplicationController
  def index
    @flocks = Flock.all
  end

  def show
    @flock = Flock.find(params[:id])
  end

  def show_birds
    @birds = Bird.joins(:flock).where("flock_id = ?", params[:id])
  end
end