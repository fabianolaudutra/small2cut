class User < ApplicationRecord
    self.primary_key = "id"
    validates :id, presence: true
    has_many :url
end
