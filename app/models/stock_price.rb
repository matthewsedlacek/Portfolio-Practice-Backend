class StockPrice < ApplicationRecord
    belongs_to :company
    has_many :transactions
end
