class ChangesValueInPortfolios < ActiveRecord::Migration[6.0]
  def change
    rename_column :portfolios, :value, :starting_value
  end
end
