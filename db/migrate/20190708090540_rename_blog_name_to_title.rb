class RenameBlogNameToTitle < ActiveRecord::Migration[5.0]
  def change

    rename_column :stories, :blog_name, :title
    change_column :stories, :title, :text

  end
end
