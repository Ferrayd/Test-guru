class DropTableTestsUsers < ActiveRecord::Migration[8.0]
  def change
    drop_table :tests_users, if_exists: true
  end
end
