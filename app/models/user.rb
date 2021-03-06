class User < ApplicationRecord
    has_many :links, dependent: :destroy
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
    has_one_attached :avatar
end
