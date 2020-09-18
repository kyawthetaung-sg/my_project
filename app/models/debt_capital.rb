class DebtCapital < ApplicationRecord
  include Filterable

  validates :date, presence: true
  validates :category_id, presence: true
  validates :amount, presence: true

  belongs_to :category

  scope :filter_by_category_id, -> (category_id) { where category_id: category_id }
  scope :filter_by_note, -> (note) { where("note LIKE ?", "%#{note}%")}
end
