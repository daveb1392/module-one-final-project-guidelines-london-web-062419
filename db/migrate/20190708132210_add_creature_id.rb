class AddCreatureId < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :creature_id, :integer
  end
end
