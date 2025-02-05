class UsersController < ApplicationController
  has_many :test_passages
  has_many :tests, through: :test_passages

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Вы успешно зарегистрировались!"
      redirect_to tests_path
    else
      flash[:alert] = "Не удалось зарегистрироваться. Проверьте данные."
      render :new
    end
  end

  def test_passage(test)
    test_passages.find_by(test: test)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
