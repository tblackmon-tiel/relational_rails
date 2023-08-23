class FlocksController < ApplicationController
  def index
    @flocks = Flock.order(created_at: :desc)
  end

  def show
    @flock = Flock.find(params[:id])
    @bird_count = Bird.where("flock_id = ?", params[:id]).count
  end

  def show_birds
    @birds = Bird.joins(:flock).where("flock_id = ?", params[:id])
  end
end