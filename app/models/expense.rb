class Expense < ApplicationRecord
  include Filterable

  validates :date, presence: true
  validates :expense_category_id, presence: true
  validates :amount, presence: true
  validates :payment_mode_id, presence: true

  belongs_to :expense_category
  belongs_to :payment_mode

  scope :filter_by_expense_category_id, -> (expense_category_id) { where expense_category_id: expense_category_id }
  scope :filter_by_payment_mode_id, -> (payment_mode_id) { where payment_mode_id: payment_mode_id }
  scope :filter_by_note, -> (note) { where("note LIKE ?", "%#{note}%")}
  scope :filter_by_start_date, -> (date) { where "date >= (?)", DateTime.parse(date).beginning_of_day }
  scope :filter_by_end_date, -> (date) { where "date <= (?)", DateTime.parse(date).end_of_day }
end
