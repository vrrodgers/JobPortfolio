class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :title
      t.text :description
      t.string :state
      t.string :city
      t.integer :year_completed
      t.text :thumb_image
      t.timestamps
    end
  end
end
