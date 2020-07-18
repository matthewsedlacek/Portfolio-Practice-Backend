class Company < ApplicationRecord
    has_many :stock_prices
    has_many :transactions, through: :stock_prices
end
