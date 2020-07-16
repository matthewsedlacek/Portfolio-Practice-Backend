class Company < ApplicationRecord
    has many :stockprices
    has_many :transactions, through: :stockprices
end
