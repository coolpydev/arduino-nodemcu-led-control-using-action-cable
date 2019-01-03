class Group < ApplicationRecord
  has_many :light_groups
  has_many :lights, through: :light_groups
end
