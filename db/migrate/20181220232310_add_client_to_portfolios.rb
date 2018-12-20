class AddClientToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :client, :string
    add_reference  :portfolios, :category, index: true
  end
end
