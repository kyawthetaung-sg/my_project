class BusinessType < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true
  validates :purchase_price, presence: true
  validates :sale_price, presence: true
  validates :quantity, presence: true

  belongs_to :category
end
