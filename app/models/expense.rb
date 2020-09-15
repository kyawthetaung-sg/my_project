class Expense < ApplicationRecord
  include Filterable

  belongs_to :expense_category
  belongs_to :payment_mode

  scope :filter_by_expense_category_id, -> (expense_category_id) { where expense_category_id: expense_category_id }
  scope :filter_by_payment_mode_id, -> (payment_mode_id) { where payment_mode_id: payment_mode_id }
  scope :filter_by_note, -> (note) { where("note LIKE ?", "%#{note}%")}
  scope :filter_by_start_date, -> (date) { where "date >= (?)", date }
  scope :filter_by_end_date, -> (date) { where "date <= (?)", date }
end
