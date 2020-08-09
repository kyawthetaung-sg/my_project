class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.datetime :date
      t.decimal :amount
      t.references :expense_category, null: false, foreign_key: true
      t.references :payment_mode, null: false, foreign_key: true
      t.text :note
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :incomes, :deleted_at
    add_index :incomes, :created_by
    add_index :incomes, :updated_by
    add_index :incomes, :deleted_by
  end
end
