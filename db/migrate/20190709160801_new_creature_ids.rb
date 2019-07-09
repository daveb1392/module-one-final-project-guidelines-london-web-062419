class NewCreatureIds < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :creature_id2, :integer
    add_column :stories, :creature_id3, :integer
  end
end
