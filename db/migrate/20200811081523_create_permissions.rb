class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.references :role, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
