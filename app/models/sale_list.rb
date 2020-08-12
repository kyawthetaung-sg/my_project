class SaleList < ApplicationRecord
  include Filterable

  belongs_to :customer
  has_many_attached :avatars

  scope :filter_by_customer_id, -> (customer_id) { where customer_id: customer_id }
  scope :filter_by_start_date, -> (date) { where "date >= (?)", date }
  scope :filter_by_end_date, -> (date) { where "date <= (?)", date }
end
