class CreateGeneralExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :general_expenses do |t|
      t.date :date
      t.references :category, null: false, foreign_key: true
      t.integer :amount
      t.text :note
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :general_expenses, :deleted_at
    add_index :general_expenses, :created_by
    add_index :general_expenses, :updated_by
    add_index :general_expenses, :deleted_by
  end
end
