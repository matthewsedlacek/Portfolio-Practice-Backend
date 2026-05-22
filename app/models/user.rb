class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 50 }
    validates :password, length: { minimum: 8, maximum: 72 }, allow_nil: true
    has_secure_password
    has_many :portfolios
    has_many :transactions, through: :portfolios
    has_one :watchlist
end
