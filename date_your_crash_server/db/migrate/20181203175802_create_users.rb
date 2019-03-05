class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :gender
      t.string :interest
      t.string :url
      t.references :match, index: true
      t.timestamps
    end
  end
end
