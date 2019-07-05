class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :blog_name
      t.string :content
    end
  end
end
