class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end

    self.current_question = next_question
    save!
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question if current_question.present?
  end
  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
  
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
  def next_question
    return unless current_question

    test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
