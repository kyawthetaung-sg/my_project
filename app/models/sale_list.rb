class SaleList < ApplicationRecord
  include Filterable

  paginates_per 25

  belongs_to :customer
  has_many_attached :avatars

  scope :filter_by_customer_id, -> (customer_id) { where customer_id: customer_id }
  scope :filter_by_product_id, -> (product_id) do
    ids = SaleListBusinessType.where(business_type_id: product_id).distinct.pluck(:sale_list_id)
    where(id: ids)
  end
  scope :filter_by_debt, -> (debt) { where(debt: true)}
  scope :filter_by_start_date, -> (date) { where "date >= (?)", DateTime.parse(date).beginning_of_day }
  scope :filter_by_end_date, -> (date) { where "date <= (?)", DateTime.parse(date).end_of_day }
  scope :filter_by_note, -> (note) { where("note LIKE ?", "%#{note}%")}

  scope :for_date_range, -> (start_date, end_date) do
    where(date: start_date.beginning_of_day..end_date.end_of_day)
  end

  scope :count_by_date, -> () do
    group('date(date)').count
  end
end
