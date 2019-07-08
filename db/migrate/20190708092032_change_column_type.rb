class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :stories, :title, :string
  end
end
