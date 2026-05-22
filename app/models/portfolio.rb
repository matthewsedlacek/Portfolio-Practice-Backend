class Portfolio < ApplicationRecord
    belongs_to :user
    has_many :transactions
    has_many :companies, through: :transactions
    validates :name, presence: true, length: { maximum: 255 }
    validates :starting_value, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999_999_999 }
    validates :locked_in_value, :available_cash,
              numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999_999_999 }, allow_nil: true
end
