class SaleListBusinessType < ApplicationRecord
  belongs_to :sale_list
  belongs_to :business_type
end
