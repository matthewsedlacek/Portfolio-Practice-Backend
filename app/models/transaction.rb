class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stock_price
    validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1
    has_one :user, through: :portfolio
    has_one :company, through: :stock_price
end
