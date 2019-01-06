class Group < ApplicationRecord
  has_many :light_groups
  has_many :lights, through: :light_groups

  def self.add_light_to_all_lights_group(light)
    group = Group.find_by(name: "All")
    group.lights << light if !group.lights.include?(light)
  end
end
