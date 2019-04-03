class LightsController < ApplicationController
  before_action :set_light, except: [:index, :new, :create]

  def index
    @lights = Light.all.includes(:groups)
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

  def add_to_group
    LightGroup.where(light_id: params[:light_id]).destroy_all # in current version, light can only exist in one group at a time

    light_group = LightGroup.create(light_id: params[:light_id], group_id: params[:group_id])

    redirect_to group_path(params[:group_id])
  end

  private

  def set_light
    @light = Light.find(params[:id])
  end
end
