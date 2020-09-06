class CreateCapitals < ActiveRecord::Migration[6.0]
  def change
    create_table :capitals do |t|
      t.date :date
      t.decimal :amount
      t.references :category, null: false, foreign_key: true
      t.text :note
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :capitals, :deleted_at
    add_index :capitals, :created_by
    add_index :capitals, :updated_by
    add_index :capitals, :deleted_by
  end
end
