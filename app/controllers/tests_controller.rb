class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  # def start
  #   @user.tests.push(@test)
  #   redirect_to @user.test_passage(@test)
  # end
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  def index
    @test = Test.all
  end
  
  private

  def set_test
    @test = Test.find(params[:id])
  end

end
