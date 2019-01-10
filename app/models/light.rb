class Light < ApplicationRecord
  has_many :light_groups
  has_many :groups, through: :light_groups

  scope :ungrouped_by_id, -> { where("id NOT IN (SELECT light_id FROM light_groups)").map{|light| [light.name, light.id]} }
end