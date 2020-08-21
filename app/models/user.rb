class User < ApplicationRecord
    has_many :recipes
    validates :name, presence: true, length: { minimum: 3, maximum: 32 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { minimum: 8, maximum: 32 }
    has_one_attached :avatar
    has_secure_password
end
