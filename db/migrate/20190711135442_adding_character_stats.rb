class AddingCharacterStats < ActiveRecord::Migration[5.0]
  def change
    add_column :creatures, :age, :string 
    add_column :creatures, :weapon, :string 
  end
end
