class AddParameters < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :parameters, :text, array: true, default: []
    add_column :celebrities, :parameters, :text, array: true, default: []
  end
end
