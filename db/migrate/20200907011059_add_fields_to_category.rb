class AddFieldsToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :show_sale, :boolean,   default: true
    add_column :categories, :show_report, :boolean,   default: true
  end
end
