class Role < ApplicationRecord
    validates :name, presence: true

    has_many :permissions
    has_many :users
end
