class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = Group.all
  end

  def show
  end

  def update
    @group.lights.each do |light|
      ActionCable.server.broadcast "arduino_#{light.fingerprint}", rgb: params[:group][:rgb]
    end
  end

  private 

  def set_group
    @group = Group.find(params[:id])
  end
end
