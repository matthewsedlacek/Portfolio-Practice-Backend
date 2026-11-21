class Company < ApplicationRecord
    VALID_SECTORS = %w[
      Communication\ Services Consumer\ Discretionary Consumer\ Staples Energy
      Financials Health\ Care Industrials Information\ Technology Materials
      Real\ Estate Technology Utilities
    ].freeze

    has_many :transactions
    has_many :watchlist_companies
    has_many :watchlists, through: :watchlist_companies

    validates :ticker, presence: true, uniqueness: true,
                       format: { with: /\A[A-Z0-9\-]{1,10}\z/, message: 'must be uppercase letters, digits, or hyphens' }
    validates :name, presence: true, length: { maximum: 255 }
    validates :logo, presence: true
    validates :sector, presence: true, inclusion: { in: VALID_SECTORS }
end
