class FlocksController < ApplicationController
  def index
    @flocks = Flock.order(created_at: :desc)
  end

  def show
    @flock = Flock.find(params[:id])
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

  def edit
    @flock = Flock.find(params[:id])
  end

  def update
    flock = Flock.find(params[:id])
    flock.update(
      name: params[:name],
      cage_number: params[:cage_number],
      accepts_new_birds: params[:accepts_new_birds]
    )
    flock.save

    redirect_to "/flocks/#{flock.id}"
  end
end