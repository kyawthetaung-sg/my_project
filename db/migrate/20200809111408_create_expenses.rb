class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
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

    add_index :expenses, :deleted_at
    add_index :expenses, :created_by
    add_index :expenses, :updated_by
    add_index :expenses, :deleted_by
  end
end
