class AddAvailableCashToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :available_cash, :float
  end
end
