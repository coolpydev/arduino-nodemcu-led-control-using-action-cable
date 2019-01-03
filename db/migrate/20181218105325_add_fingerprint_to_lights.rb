class AddFingerprintToLights < ActiveRecord::Migration[5.2]
  def change
    add_column :lights, :fingerprint, :string
  end
end
