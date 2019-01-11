class RemoveLightGroupIdFromLights < ActiveRecord::Migration[5.2]
  def change
    remove_column :lights, :light_group_id, :integer
  end
end
