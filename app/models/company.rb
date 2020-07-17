class Company < ApplicationRecord
    has_many :stockprices
    has_many :transactions, through: :stockprices
end
