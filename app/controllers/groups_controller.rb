class GroupsController < ApplicationController
  before_action :set_group, except: [:index, :new, :create]

  def index
    # queries will be scoped when users are added to app
    groups = Group.order(:name).includes(:lights)
    ungrouped_lights = Light.ungrouped

    return render :json => {
      "groups": groups.as_json(include: [:lights]),
      "ungroupedLights": ungrouped_lights.as_json(include: [:groups])
    }
  end

  def show
    lights = Light.includes(:light_groups).where(light_groups: { group_id: params[:id] })

    return render :json => {"lights": lights}
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
    rgb = params.dig(:group, :rgb).permit!
    if @group.update_lights(rgb)
      @group.save_color_state(rgb)
      message = "Updated lights"
    else
      message = "Lights could not be updated." # update this in future to connect to light and confirm current state
    end

    return render :json => { color: "rgba(#{rgb[:r]}, #{rgb[:g]}, #{rgb[:b]}, 0.6)", rgb: rgb }
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
