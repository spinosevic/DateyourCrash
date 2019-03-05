class CreateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descriptions do |t|
      t.belongs_to :desc, polymorphic: true, index: true
      t.integer :arched_eyebrows
      t.integer :beard
      t.integer :big_lips
      t.integer :big_nose
      t.integer :black_hair
      t.integer :blond_hair
      t.integer :bushy_eyebrows
      t.integer :chubby
      t.integer :heavy_makeup
      t.integer :high_cheekbones
      t.integer :mustache
      t.integer :narrow_eyes
      t.integer :pale_skin
      t.integer :pointy_nose
      t.integer :receding_hairline
      t.integer :rosy_cheeks
      t.integer :straight_hair
      t.integer :wavy_hair
      t.integer :white
      t.integer :asian
      t.integer :hispanic
      t.integer :black
      t.integer :indian
      t.timestamps
    end
  end
end
