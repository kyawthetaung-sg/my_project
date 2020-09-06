class CreateSaleListBusinessTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_list_business_types, :id => false do |t|
      t.references :sale_list, null: false, foreign_key: true
      t.references :business_type, null: false, foreign_key: true
      t.decimal :sale_price
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :sale_list_business_types, :deleted_at
    add_index :sale_list_business_types, :created_by
    add_index :sale_list_business_types, :updated_by
    add_index :sale_list_business_types, :deleted_by
  end
end
