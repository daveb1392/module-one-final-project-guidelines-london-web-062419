class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :stories, :creature_id
    remove_column :stories, :creature_id2
    remove_column :stories, :creature_id3
  end
end
