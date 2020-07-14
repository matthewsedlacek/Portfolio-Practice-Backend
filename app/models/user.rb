class User < ApplicationRecord
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, :password, presence: true
    has_secure_password
end
