class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: [ :index, :new, :create ]
  before_action :set_question, only: [ :show, :edit, :update, :destroy ]

  def index
    @questions = Question.all
  end

  def show
    @test = @question.test
  end

  # def create
  #   @question = @test.questions.build(question_params)
  #   if @question.save
  #     redirect_to test_questions_path(@test), notice: "Вопрос успешно добавлен."
  #   else
  #     render index, alert: "Ошибка при добавлении вопроса."
  #   end
  # end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(@test), notice: "Question was successfully created."
    else
      render :new
    end
  end
  def new
    @question = @test.questions.build  # Создание нового вопроса, связанного с тестом
  end

  #  def update
  #    @question.update(
  #      body: params[:question][:body],
  #    )
  #    redirect_to test_question_path(@question)
  #  end

  def edit
    # @question уже загружается через set_question
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "Question was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_questions_path(@test), notice: "Вопрос удалён."
  end

  private
  #  def set_test
  #    @test = Test.find_by(id: params[:test_id])  # Используем find_by, чтобы избежать исключения
  #    unless @test
  #      redirect_to tests_path, alert: "Test not found."
  #    end
  #  end
  def set_test
    if params[:test_id]
      @test = Test.find_by(id: params[:test_id])
      redirect_to tests_path, alert: "Test not found." unless @test
    end
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
