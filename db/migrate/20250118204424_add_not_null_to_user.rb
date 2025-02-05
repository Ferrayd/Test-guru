class AddNotNullToUser < ActiveRecord::Migration[8.0]
  def change
    change_column(:users, :user_name, :string, null: false)
    change_column(:users, :email, :string, null: false)
    change_column(:users, :password, :string, null: false)
    change_column(:users, :block, :boolean, default: 0)
  end
end
