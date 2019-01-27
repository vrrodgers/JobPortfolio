class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :category
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
