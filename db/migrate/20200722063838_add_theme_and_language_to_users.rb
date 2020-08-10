class AddThemeAndLanguageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :theme, foreign_key: true
    add_column :users, :language, :int, null: false, default: 1
  end
end
