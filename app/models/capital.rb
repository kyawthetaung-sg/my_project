class Capital < ApplicationRecord
  validates :date, :amount, presence: true
end
