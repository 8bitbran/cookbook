class User < ApplicationRecord
    has_many :recipes
    has_many :likes
    has_many :comments
    validates :name, presence: true, length: { minimum: 3, maximum: 32 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { minimum: 8, maximum: 32 }
    has_one_attached :image
    has_secure_password
end
