class CreatePortfolioImages < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_images do |t|
      t.text :image
      t.references :portfolio, foreign_key: true
      t.timestamps
    end
  end
end
