class AddIdsToLightGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :light_groups, :group_id, :bigint, foreign_key: true
    add_column :light_groups, :light_id, :bigint, foreign_key: true
  end
end
