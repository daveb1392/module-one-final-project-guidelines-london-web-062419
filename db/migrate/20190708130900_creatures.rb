class Creatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :creature
    end 
  end
end
