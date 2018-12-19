class CreateProjectDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :project_descriptions do |t|
      t.string :name
      t.text :body
      t.references :project, foregin_key: true
      t.integer :position
      t.timestamps
    end
  end
end
