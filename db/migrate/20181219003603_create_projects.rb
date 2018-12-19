class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :title
      t.string :state
      t.string :city
      t.string :start_month 
      t.integer :start_year
      t.string :end_month
      t.integer :end_year
      t.text :thumb_image
      t.references :project_type, foreign_key: true
      t.timestamps
    end
  end
end
