class Light < ApplicationRecord
  has_many :light_groups
  has_many :groups, through: :light_groups
end
