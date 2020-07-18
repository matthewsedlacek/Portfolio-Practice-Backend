class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stock_price
    has_one :user, through: :portfolio
    has_one :company, through: :stock_price
end
