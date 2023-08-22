class FlocksController < ApplicationController
  def index
    @flocks = Flock.all
  end
end