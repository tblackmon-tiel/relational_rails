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

  def new

  end

  def create
    flock = Flock.new(
      name: params[:name],
      cage_number: params[:cage_number],
      accepts_new_birds: params[:accepts_new_birds]
    )
    flock.save
    
    redirect_to "/flocks"
  end
end