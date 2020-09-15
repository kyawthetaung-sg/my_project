class BusinessType < ApplicationRecord
  include Filterable

  paginates_per 25

  validates :name, presence: true
  validates :category_id, presence: true
  validates :purchase_price, presence: true
  validates :sale_price, presence: true
  validates :quantity, presence: true

  belongs_to :category

  scope :filter_by_category_id, -> (category_id) { where category_id: category_id }
  scope :filter_by_name, -> (name) { where("name LIKE ?", "%#{name}%")}
end
