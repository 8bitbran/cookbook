class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 32 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8, maximum: 32 }
    has_one_attached :avatar
    has_secure_password
end
