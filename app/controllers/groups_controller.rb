class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = Group.all # queries will be scoped when users were added to app
    @lights = Light.all 
  end

  def update
    rgb = params.dig(:group, :rgb)
    
    if @group.update_lights(params[:group][:rgb])
      @group.save_color_state(params[:group][:rgb])
      message = "Updated lights"
    else
      message = "Lights could not be updated." # update this in future to connect to light and confirm current state
    end

    respond_to do |format|
      format.js {render :json => {color: "rgba(#{rgb[:r]}, #{rgb[:g]}, #{rgb[:b]}, 0.6)"}}
    end
  end

  private 

  def set_group
    @group = Group.find(params[:id])
  end
end
