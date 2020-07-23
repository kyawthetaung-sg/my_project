class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.datetime :deleted_at
      t.integer :created_by, :limit => 8
      t.integer :updated_by, :limit => 8
      t.integer :deleted_by, :limit => 8

      t.timestamps
    end

    add_index :roles, :deleted_at
    add_index :roles, :created_by
    add_index :roles, :updated_by
    add_index :roles, :deleted_by
  end
end
