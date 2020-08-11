class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :companies, through: :transactions
    validates :starting_value, :numericality => { greater_than_or_equal_to: 100 }
end
