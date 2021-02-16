class Link < ApplicationRecord
    belongs_to :user
    validates :app_name, presence: true
    validates :url, presence: true
end
