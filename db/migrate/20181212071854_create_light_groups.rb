class CreateLightGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :light_groups do |t|
      t.string :description
      t.timestamps
    end
  end
end
