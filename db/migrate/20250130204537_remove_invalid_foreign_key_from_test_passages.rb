class RemoveInvalidForeignKeyFromTestPassages < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :test_passages, column: :current_question_id
  end
end
