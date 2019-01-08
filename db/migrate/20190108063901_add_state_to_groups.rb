class AddStateToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :rgb_state, :json
  end
end
