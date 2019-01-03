class LightsController < ApplicationController
  before_action :set_light, except: [:index, :new, :create]

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
    ActionCable.server.broadcast "arduino_#{@light.fingerprint}", rgb: params[:light][:rgb]
  end

  def destroy
  end

  private 

  def set_light
    @light = Light.find(params[:id])
  end

end
