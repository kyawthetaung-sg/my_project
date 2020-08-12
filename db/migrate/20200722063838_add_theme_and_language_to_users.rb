class AddThemeAndLanguageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :theme, null: false, foreign_key: true
    add_column :users, :language, :int, null: false, default: 1
  end
end
