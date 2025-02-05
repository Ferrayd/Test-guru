class AddNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null(:tests, :title, false)
    change_column(:tests, :level, :integer, default: 0)
    change_column(:answers, :body, :text, null: false)
    change_column(:answers, :correct, :boolean, default: 0)
    change_column(:categories, :title, :string, null: false)
    change_column(:questions, :body, :text, null: false)
  end
end
