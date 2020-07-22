class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :stock_prices, through: :transactions
end
