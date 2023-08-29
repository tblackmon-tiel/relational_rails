class BirdsController < ApplicationController
  def index
    @birds = Bird.get_bonded_birds
  end

  def show
    @bird = Bird.find(params[:id])
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    bird = Bird.find(params[:id])
    bird.update(
      name: params[:name],
      flock_id: params[:flock_id],
      band_id: params[:band_id],
      age: params[:age],
      is_bonded: params[:is_bonded]
    )
    bird.save

    redirect_to "/birds/#{bird.id}"
  end

  def destroy
    bird = Bird.find(params[:id])
    bird.destroy

    redirect_to "/birds"
  end
end