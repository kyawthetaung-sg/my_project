class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.text :address
      t.text :note
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :customers, :deleted_at
    add_index :customers, :created_by
    add_index :customers, :updated_by
    add_index :customers, :deleted_by
  end
end
