class AddTrait < ActiveRecord::Migration[5.0]
  def change
    add_column :creatures, :trait, :string
  end
end
