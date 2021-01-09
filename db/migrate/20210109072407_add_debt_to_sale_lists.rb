class AddDebtToSaleLists < ActiveRecord::Migration[6.0]
  def change
    add_column :sale_lists, :debt, :boolean, default: false
  end
end
