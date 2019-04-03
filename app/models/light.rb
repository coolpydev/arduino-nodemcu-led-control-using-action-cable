class Light < ApplicationRecord
  has_many :light_groups
  has_many :groups, through: :light_groups

  scope :ungrouped, -> { includes(:light_groups).where(light_groups: { light_id: nil }) }
end
