class RemovePasswordFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :password, :string    # Удаление поля password
    change_column(:users, :password_digest, :string, null: false)
  end
end
