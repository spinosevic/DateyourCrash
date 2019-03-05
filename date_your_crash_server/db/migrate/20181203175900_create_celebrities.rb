class CreateCelebrities < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :gender
      t.string :url   
      t.timestamps
    end
  end
end
