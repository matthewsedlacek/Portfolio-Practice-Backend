class AddLockedInValueToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :locked_in_value, :float
  end
end
