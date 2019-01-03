class AddNamesToLights < ActiveRecord::Migration[5.2]
  def change
    add_column :lights, :name, :text
  end
end
