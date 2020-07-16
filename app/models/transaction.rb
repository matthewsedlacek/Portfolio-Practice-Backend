class Transaction < ApplicationRecord
    belongs_to :portfolio
    belongs_to :stockprice
    has_one :user, through: :portfolio
    has_one :company, through: :stockprice
end
