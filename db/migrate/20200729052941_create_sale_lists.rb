class CreateSaleLists < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_lists do |t|
      t.datetime :date
      t.references :customer, null: false, foreign_key: true
      t.decimal :first_payment, null: false, default: 0
      t.string :image
      t.text :note
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :sale_lists, :deleted_at
    add_index :sale_lists, :created_by
    add_index :sale_lists, :updated_by
    add_index :sale_lists, :deleted_by
  end
end
