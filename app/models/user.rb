class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :password, presence: true
    has_secure_password
    has_many :portfolios
    has_many :transactions, through: :portfolios
    has_one :watchlist
end
