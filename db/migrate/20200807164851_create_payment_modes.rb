class CreatePaymentModes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_modes do |t|
      t.string :name
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :payment_modes, :deleted_at
    add_index :payment_modes, :created_by
    add_index :payment_modes, :updated_by
    add_index :payment_modes, :deleted_by
  end
end
