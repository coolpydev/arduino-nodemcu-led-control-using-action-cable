class Group < ApplicationRecord
  has_many :light_groups
  has_many :lights, through: :light_groups
  after_create :set_initial_rgb

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
    self.save
  end

  private 

  def set_initial_rgb
    self.rgb_state = {r: 0, g: 0, b: 0}
    self.save
  end

end
