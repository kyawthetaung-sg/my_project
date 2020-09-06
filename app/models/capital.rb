class Capital < ApplicationRecord
  validates :date, :amount, :category_id, presence: true

  belongs_to :category
end
