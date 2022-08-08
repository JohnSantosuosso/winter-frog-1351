class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def destroy
    @plot = Plot.find(params[:id])
    @plot.plants.delete(params[:plant_id])
    redirect_to "/plots"
  end

end