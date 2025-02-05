module QuestionsHelper
  def question_header(question)
    test = question.test
    if question.new_record?
      "Создать новый вопрос для #{test.title}"
    else
      "Изменить вопрос в #{test.title}"
    end
  end
end
