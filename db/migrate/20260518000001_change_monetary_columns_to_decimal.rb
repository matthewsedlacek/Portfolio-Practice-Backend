class ChangeMonetaryColumnsToDecimal < ActiveRecord::Migration[7.0]
  def up
    change_column :portfolios, :starting_value, :decimal, precision: 15, scale: 4
    change_column :portfolios, :locked_in_value, :decimal, precision: 15, scale: 4
    change_column :portfolios, :available_cash, :decimal, precision: 15, scale: 4
    change_column :transactions, :value, :decimal, precision: 15, scale: 4
    change_column :transactions, :share_price, :decimal, precision: 15, scale: 4
  end

  def down
    change_column :portfolios, :starting_value, :float
    change_column :portfolios, :locked_in_value, :float
    change_column :portfolios, :available_cash, :float
    change_column :transactions, :value, :float
    change_column :transactions, :share_price, :float
  end
end
