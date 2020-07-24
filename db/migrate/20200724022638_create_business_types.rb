class CreateBusinessTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :business_types do |t|
      t.string :name
      t.integer :purchase_price
      t.integer :sale_price
      t.integer :quantity
      t.references :category, null: false, foreign_key: true
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :business_types, :deleted_at
    add_index :business_types, :created_by
    add_index :business_types, :updated_by
    add_index :business_types, :deleted_by
  end
end
