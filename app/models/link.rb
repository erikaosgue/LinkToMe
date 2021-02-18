class Link < ApplicationRecord
    belongs_to :user
    validates :app_name, presence: {message: "App name shouldn't not be empty"}
    validates :url, presence: {message: "Url shouldn't be empty"}
end
