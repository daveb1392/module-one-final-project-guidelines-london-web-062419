class Traits < ActiveRecord::Migration[5.0]
  def change
  create_table :traits do |t|
    t.string :name
  end 
 end
end