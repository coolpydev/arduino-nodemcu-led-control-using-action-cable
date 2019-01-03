class LightsController < ApplicationController
  def index
    @lights = Light.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def change_color
    ActionCable.server.broadcast 'arduino', rgb: params[:rgb]
  end
end
