class Group < ApplicationRecord
  has_many :light_groups
  has_many :lights, through: :light_groups

  def self.add_light_to_all_lights_group(light)
    group = Group.find_by(name: "All")
    group.lights << light if !group.lights.include?(light)
  end

  def update_lights(rgb)
    begin
      self.lights.each do |light|
        ActionCable.server.broadcast "arduino_#{light.fingerprint}", rgb: rgb
      end
      return true
    rescue
      return false
    end
  end

  def save_color_state(rgb)
    self.rgb_state = rgb
  end

end
