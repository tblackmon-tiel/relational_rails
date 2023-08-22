class FlocksController < ApplicationController
  def index
    @flocks = Flock.all
  end

  def show
    @flock = Flock.find(params[:id])
  end
end