class FlocksController < ApplicationController
  def index
    if params[:sort] == nil
      @flocks = Flock.flocks_by_creation_date
    else
      @flocks = Flock.order_by_count
    end
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

  def destroy
    flock = Flock.find(params[:id])
    flock.destroy

    redirect_to "/flocks"
  end
end