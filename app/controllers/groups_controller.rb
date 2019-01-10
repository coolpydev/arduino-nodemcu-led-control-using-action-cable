class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = Group.all.order(:name) # queries will be scoped when users were added to app
    @lights = Light.all 
    @ungrouped_lights = Light.ungrouped_by_id
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      message = "Group added!"
    else
      message = "Issue creating group, please try again."
    end
    redirect_to groups_path, message: message
  end

  def update 
    # change light status
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

  def get_current_state
    rgb = Group.find(params[:id]).rgb_state
    render :json => rgb
  end

  private 

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
