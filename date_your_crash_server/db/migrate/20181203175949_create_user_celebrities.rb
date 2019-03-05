class CreateUserCelebrities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_celebrities do |t|
      t.integer :user_id
      t.integer :celebrity_id
      t.integer :output
      t.timestamps
    end
  end
end
