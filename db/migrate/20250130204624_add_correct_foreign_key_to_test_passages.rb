class AddCorrectForeignKeyToTestPassages < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :test_passages, :questions, column: :current_question_id
  end
end
