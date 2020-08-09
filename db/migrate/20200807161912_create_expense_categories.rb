class CreateExpenseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_categories do |t|
      t.string :name
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :expense_categories, :deleted_at
    add_index :expense_categories, :created_by
    add_index :expense_categories, :updated_by
    add_index :expense_categories, :deleted_by
  end
end
