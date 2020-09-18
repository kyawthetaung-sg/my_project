class CreateDebtCapitals < ActiveRecord::Migration[6.0]
  def change
    create_table :debt_capitals do |t|
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

    add_index :debt_capitals, :deleted_at
    add_index :debt_capitals, :created_by
    add_index :debt_capitals, :updated_by
    add_index :debt_capitals, :deleted_by
  end
end
