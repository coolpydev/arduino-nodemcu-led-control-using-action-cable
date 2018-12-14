class CreateLights < ActiveRecord::Migration[5.2]
  def change
    create_table :lights do |t|
      t.belongs_to :light_group
      t.timestamps
    end
  end
end
