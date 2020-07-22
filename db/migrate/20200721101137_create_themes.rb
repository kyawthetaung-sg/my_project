class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :color
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :themes, :deleted_at
    add_index :themes, :created_by
    add_index :themes, :updated_by
    add_index :themes, :deleted_by
  end
end
