class Admin::TestsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_test, only: %i[show edit update destroy start]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  def index
    @test = Test.all
  end
  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])

    @test.destroy
    redirect_to tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
