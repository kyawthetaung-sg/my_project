class Customer < ApplicationRecord
    include Filterable

    validates :name, presence: true

    has_many :sale_lists

    scope :filter_by_name, -> (name) { where("name LIKE ?", "#{name}%")}
end
