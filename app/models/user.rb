class User < ApplicationRecord
    has_many :links, dependent: :destroy
end
