class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = Group.all # queries will be scoped when users were added to app
    @lights = Light.all 
  end

  def show
  end

  def update
    @group.lights.each do |light|
      ActionCable.server.broadcast "arduino_#{light.fingerprint}", rgb: params[:group][:rgb]
    end
    
    respond_to do |format|
      format.js {render :json => {color: "rgba(#{params[:group][:rgb][:r]}, #{params[:group][:rgb][:g]}, #{params[:group][:rgb][:b]}, 0.6)"}}
    end
  end

  private 

  def set_group
    @group = Group.find(params[:id])
  end
end
