class Category < ApplicationRecord
    validates :name, presence: true

    has_many :business_types
end
